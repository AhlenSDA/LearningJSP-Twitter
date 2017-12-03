package com.sda.servlets;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyTweet {

    private String author;
    private String tweet;
    private Long timestamps;

}
