package com.domain;

public class Echart {
    private String time;
    private Integer data;

    public Echart() {
    }

    public String getTime() {
        return this.time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getData() {
        return this.data;
    }

    public void setData(Integer data) {
        this.data = data;
    }
}
