package com.java.hotelmanagement.exception;

public class RoomNotFoundException extends RuntimeException {
	public RoomNotFoundException(String message) {
		super(message);
	}
}
