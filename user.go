package todo

type User struct {
	ID       int    `json:"-"`
	Name     string `json:"name" binding:"required"`
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

type UserList struct {
	ID     int `json:"id"`
	UserID int `json:"user_id"`
	ListID int `json:"list_id"`
}

type ItemTodo struct {
	ID          int    `json:"id"`
	Title       string `json:"title"`
	Description string `json:"description"`
	Done        bool   `json:"done"`
}

type ListItem struct {
	ID     int `json:"id"`
	ItemID int `json:"item_id"`
	ListID int `json:"list_id"`
}
