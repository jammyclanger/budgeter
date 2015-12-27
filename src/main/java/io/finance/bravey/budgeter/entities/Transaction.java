package io.finance.bravey.budgeter.entities;

public class Transaction {
	private String type;
	private Long id;
	private String reference;
	private Double amount;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Transaction(Long id, String reference, Double amount) {
		super();
		this.type = "item";
		this.id = id;
		this.reference = reference;
		this.amount = amount;
	}

	public Transaction() {

	}

	public Transaction(String id, String reference, String amount) throws NumberFormatException {
		this.type = "item";
		this.id = Long.parseLong(id);
		this.reference = reference;
		this.amount = Double.parseDouble(amount);
	}

	@Override
	public String toString() {
		return String.format("Id: %s, Amount: %s, Reference: %s", this.id, this.amount, this.reference);
	}
}
