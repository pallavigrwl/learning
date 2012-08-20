package com.user;

public class User {

	private String name;
	private int id;
	public User(String name, int i) {
	this.name=name;
	this.id=i;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
