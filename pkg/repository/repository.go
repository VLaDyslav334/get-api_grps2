package repository

import (
	todo "get_api-grps"

	"github.com/jmoiron/sqlx"
)

type User struct {
	// Add user fields here, for example:
	Id       int
	Username string
	Password string
}

type Authorization interface {
	CreateUser(user todo.User) (int, error)
}

type TodoList interface {
}

type TodoItem interface {
}

type Repository struct {
	Authorization
	TodoList
	TodoItem
}

func NewRepository(db *sqlx.DB) *Repository {
	return &Repository{
		Authorization: NewAuthPostgres(db),
	}
}
