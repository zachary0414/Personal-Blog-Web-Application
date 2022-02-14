package com.dao;


import com.po.Comment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {


    List<Comment> findByBlogIdAndSonCommentNull(Long blogId, Sort sort);
}
