package com.luowg.lesson.mapper;

import java.util.List;

import com.luowg.lesson.po.Lesson;

public interface LessonMapper {
  public List<Lesson> init(Lesson lesson) throws Exception;
  public void update(Lesson lesson) throws Exception;
  
}
