package com.techelevator.model.dto;

public class Brewery {

    private int id;

    private String name;

    private int brewer;

    // Need to add variable for bewers name

    private String hoursOfOperation;

    private String phone;

    private String history;

    private String image;

    private Boolean activityStatus;

    private String address;

    public void setId(int id) {this.id = id;}

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBrewer() {
        return brewer;
    }

    public void setBrewer(int brewer) {
        this.brewer = brewer;
    }

    public String getHoursOfOperation() {
        return hoursOfOperation;
    }

    public void setHoursOfOperation(String hoursOfOperation) {
        this.hoursOfOperation = hoursOfOperation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Boolean getActivityStatus() {
        return activityStatus;
    }

    public void setActivityStatus(Boolean activityStatus) {
        this.activityStatus = activityStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Brewery(int id, String name, int brewer, String hoursOfOperation, String phone, String history, String image,
                   String address, Boolean activityStatus) {
        this.id = id;
        this.name = name;
        this.brewer = brewer;
        this.hoursOfOperation = hoursOfOperation;
        this.phone = phone;
        this.history = history;
        this.image = image;
        this.address = address;
        this.activityStatus = activityStatus;
    }
    public Brewery() {};
}
