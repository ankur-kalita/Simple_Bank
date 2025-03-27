package db

import (
	"testing"
	// "context"
)
func TestCreatAccount(t *testing.T) {
	arg := CreateAccountParams{
		Owner: "hitler",
		Balance: 100,
		Currency: "USD",
	}
	account, err := testQueries.CreateAccount(context.Background(), arg)
}