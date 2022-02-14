package com.web.admin;

import com.po.Blog;
import com.po.User;
import com.service.BlogService;
import com.service.TagService;
import com.service.TypeService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.vo.BlogQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class BlogController {

//    private static final String PUBLISH="admin/publish";
//    private static final String LIST="admin/blogs";
//    private static final String REDIRECT_LIST="redirect:/admin/blogs";

    @Autowired
    private BlogService blogService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;

    @GetMapping("/blogs")
    public String blogs(@PageableDefault(size = 3, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                        BlogQuery blog, Model model){
        model.addAttribute("types",typeService.listType());
        model.addAttribute("page",blogService.listBlog((org.springframework.data.domain.Pageable) pageable, blog));
        return "admin/blogs";
    }

    @PostMapping("/blogs/search")
    public String search(@PageableDefault(size = 3, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                        BlogQuery blog, Model model){
        model.addAttribute("page",blogService.listBlog((org.springframework.data.domain.Pageable) pageable, blog));
        return "admin/blogs :: blogList";
//        fregument待处理更改优化 P32
    }

    @GetMapping("/blogs/publish")
    public String publish(Model model){
        setTypeAndTag(model);
        model.addAttribute("blog", new Blog());
        return "admin/publish";
    }

    private void setTypeAndTag(Model model){
        model.addAttribute("types",typeService.listType());
        model.addAttribute("tags",tagService.listTag());
    }

    @GetMapping("/blogs/{id}/input")
    public String edit(@PathVariable Long id, Model model){
        setTypeAndTag(model);
        Blog blog = blogService.getBlog(id);
        blog.init();
        model.addAttribute("blog", blog);
        return "admin/publish";
    }

    @PostMapping("/blogs")
    public String post(Blog blog, RedirectAttributes attributes, HttpSession session){

        blog.setUser((User) session.getAttribute("user"));
        blog.setType(typeService.getType(blog.getType().getId()));
        blog.setTags(tagService.listTag(blog.getTagIds()));

        Blog blog1 = blogService.saveBlog(blog);

        if (blog.getId() == null) {
            blog1 =  blogService.saveBlog(blog);
        } else {
            blog1 = blogService.updateBlog(blog.getId(), blog);
        }

        if (blog1 == null){
            attributes.addFlashAttribute("message","adding failure");
        }
        else{
            attributes.addFlashAttribute("message","adding success");
        }
        return "redirect:/admin/blogs";
    }

    @GetMapping("/blogs/{id}/delete")
    public String delete(@PathVariable Long id,RedirectAttributes attributes){
        blogService.deleteBlog(id);
        attributes.addFlashAttribute("message","Delete success");
        return "redirect:/admin/blogs";
    }
}

