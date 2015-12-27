package io.finance.bravey.budgeter.controller;

import io.finance.bravey.budgeter.entities.Transaction;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class BudgeterController {

	@RequestMapping("/")
	public ModelAndView index() {

		return new ModelAndView("budgeter/start.jsp");
	}

	@RequestMapping(path = "/upload", method = RequestMethod.POST)
	public List<Transaction> uploadTransactionsFile(@RequestParam("file") MultipartFile file) throws IOException {

		ByteArrayInputStream stream = new ByteArrayInputStream(file.getBytes());
		String readInput = IOUtils.toString(stream, "UTF-8");

		String[] splitLines = readInput.split("\n");
		List<Transaction> transactions = new ArrayList<Transaction>();
		
		for (String line : splitLines) {
			String[] exploded = line.split(",");
			Transaction transaction = new Transaction(exploded[0], exploded[1], exploded[2]);
			transactions.add(transaction);
		}

		return transactions;
	}

	@RequestMapping("/hello")
	public ModelAndView getTransactions() throws IOException {

		URL url = this.getClass().getClassLoader().getResource("Transactions.csv");

		BufferedReader in = new BufferedReader(new FileReader(url.getPath()));
		String line = "";

		List<Transaction> transactions = new ArrayList<Transaction>();
		while ((line = in.readLine()) != null) {
			String[] exploded = line.split(",");
			Transaction transaction = new Transaction(exploded[0], exploded[1], exploded[2]);
			System.out.println("Working on: " + transaction.toString());
			transactions.add(transaction);
		}

		in.close();

		ModelAndView model = new ModelAndView("budgeter/index.jsp");

		return model;
	}
}
