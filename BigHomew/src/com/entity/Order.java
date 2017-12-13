package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="userorder")
public class Order {
	private int id;
	private String userName;
	private int sumprice;
	private String address;
	private String time;
	private int guanli;
	private String state;
	@Id
    @GeneratedValue(generator="my_gen")
    @GenericGenerator(name = "my_gen", strategy = "increment")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getGuanli() {
		return guanli;
	}
	public void setGuanli(int guanli) {
		this.guanli = guanli;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	




}
