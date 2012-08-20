package com.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.user.Chat;
import com.user.User;

@Controller
public class ChatController {

	private static List<User> user = new ArrayList<User>();
	static {
		user.add(new User("Pallavi", 1));
		user.add(new User("George", 2));
		user.add(new User("Bill", 3));
		user.add(new User("Rohit", 4));
	}
	private static List<Chat> chats = new ArrayList<Chat>();

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView validateUser(@RequestParam("Name") String userName) {
		for (int i = 0; i < user.size(); i++) {
			if (user.get(i).getName().equalsIgnoreCase(userName)) {
				return new ModelAndView("chat", "user", user.get(i));
			}
		}
		return new ModelAndView("error", "error", new String("error occured"));
	}

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public @ResponseBody
	String addUser(String name) {
		String returnText;
		if (user.add(new User(name, ChatController.user.size() + 1))) {
			returnText = "User has been added to the list. Total number of users are "
					+ ChatController.user.size();
		} else {
			returnText = "Sorry, an error has occur. User has not been added to list.";
		}
		return returnText;
	}

	/*
	 * @RequestMapping(value = "/send", method = RequestMethod.GET) public
	 * ModelAndView sendChat(@RequestParam("Name") String sender,
	 * 
	 * @RequestParam("send_to") String reciever,
	 * 
	 * @RequestParam("message") String message) { Chat chat = null; User recieve
	 * = getUser(reciever); User send = getUser(sender); if (recieve.getId() !=
	 * 100) { chat = new Chat(message, send, recieve); chats.add(chat); } return
	 * new ModelAndView("send", "chat", chat.getMessage()); }
	 */
	@RequestMapping(value = "/chat", method = RequestMethod.POST)
	@ResponseBody
	public String sendChat(@RequestParam("Name") String sender, String sendTo,
			String message) {
		Chat chat = null;
		User recieve = getUser(sendTo);
		User send = getUser(sender);
		if (recieve.getId() != 100) {
			chat = new Chat(message, send, recieve);
			chats.add(chat);
			return sendTo  + "  " + message;
		}
		return "Oops!!!";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public ModelAndView checkMessage(@RequestParam("Name") String reciever) {
		Map<String, String> messages = new HashMap<String, String>();
		for (int i = 0; i < chats.size(); i++) {
			if (chats.get(i).getReciever().getName().equalsIgnoreCase(reciever)) {
				messages.put(chats.get(i).getSender().getName(), chats.get(i)
						.getMessage());
			}
		}
		return new ModelAndView("check", "messages", messages);
	}

	private User getUser(String name) {
		for (int i = 0; i < user.size(); i++) {
			if (user.get(i).getName().equalsIgnoreCase(name)) {
				return user.get(i);
			}
		}
		return new User(name, 100);

	}
}