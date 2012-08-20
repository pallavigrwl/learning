package com.user;

public class Chat {
	
	String message;
	User sender;
	User reciever;
	public Chat(String message, User sender, User reciever) {
		super();
		this.message = message;
		this.sender = sender;
		this.reciever = reciever;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReciever() {
		return reciever;
	}
	public void setReciever(User reciever) {
		this.reciever = reciever;
	}
	

}
