package io.finance.bravey.budgeter.response;

import io.finance.bravey.budgeter.entities.Transaction;

import java.util.List;

public class TransactionResponse {
	private List<Transaction> transactions;

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}

	public TransactionResponse() {

	}
}
