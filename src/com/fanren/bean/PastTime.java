package com.fanren.bean;

import java.util.Date;
import java.util.function.DoubleBinaryOperator;

/**
 * @Author: FanrenCLI
 * @Date: 2018/11/19 19:54
 * @Description: Class
 * @version:
 */
public class PastTime {
    private Integer id;
    private String name;
    private Date time;
    private String location;
    private String people;
    private String awards;
    private double lon;
    private double lat;

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public PastTime(Integer id, String name, Date time, String location, String people, String awards, double lon, double lat) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.location = location;
        this.people = people;
        this.awards = awards;
        this.lat = lat;
        this.lon = lon;
    }

    public PastTime() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getAwards() {
        return awards;
    }

    public void setAwards(String awards) {
        this.awards = awards;
    }



}
