package com.sda.twitter.service;

import com.sda.twitter.model.MyTweet;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

public class MyTwitterService {

    private static MyTwitterService _instance;

    private List<MyTweet> myTweetList;

    // It s a good practise to initialize variables in constructor
    private MyTwitterService() {
        myTweetList = new LinkedList<MyTweet>();
    }

    // Singleton
    public static MyTwitterService getInstance() {
        if (_instance == null) {
            _instance = new MyTwitterService();
        }
        return _instance;
    }

    public void addTweet(MyTweet tweet) {
        myTweetList.add(tweet);
    }

    public List<MyTweet> getMyTweetList() {
        // we secure list from being modified by others by creating unmodifiableList
        return Collections.unmodifiableList(myTweetList);
    }

}
