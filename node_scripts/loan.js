
// $41,000
//

var loanAmount = process.argv[2];
var loanPercentage = process.argv[3];
var monthlyPayment = parseInt (process.argv[4]);

var currentLoan = loanAmount;
var monthlyIncrease = 1 + (loanPercentage / 12);

var amountPaid = 0;
var numMonths = 0;

while (currentLoan > 0) {
	currentLoan -= monthlyPayment;
	currentLoan = monthlyIncrease * currentLoan;

	amountPaid += monthlyPayment;
	numMonths++;
}

console.log ("You have $" + loanAmount + " in debt, and are paying it off at $" + monthlyPayment + " per month");
console.log ("It will take you " + parseInt (numMonths / 12) + " years and " + (numMonths % 12) + " months to pay it off.");
console.log ("You will end up paying $" + amountPaid + ".  Which means you pay them $" + (amountPaid - loanAmount) + " in interest.");
