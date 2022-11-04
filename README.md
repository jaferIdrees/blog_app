![](https://img.shields.io/badge/Microverse-blueviolet)

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

# Blog App

> Interactive API with database on which you can add users, posts, comments, and likes with the related associations


## Built With

- Major languages: ruby, css, ruby on rails


## Live Demo 

[comming soon]()


## Getting Started

-

### Prerequisites
- ruby version (3.0) or above
- Rails 7.0 or above
- Postgresql db

### Setup & Installation
- Clone the repo (https://github.com/jaferIdrees/blog_app.git)
- run (bundle install) command
### Usage
- on your console run (rails server command)
- on the browser navigate to ('http://localhost:3000/')
- Enjoy ...........

### API endpoints

This API uses Devise-JWT for authentication, hence other than the signup and login requests each request should have a token.
- After running the rails server, you can reach the below API end-points from the browser's console window (The same window where you see the localhost)
- To signup a new user, a POST request should be sent to the API including at least the required three attributes (name, email and a password). As a result a new user will be created and a new token will be returned, use the below example:
`fetch("http://127.0.0.1:3001/signup", {
  method: "post",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    user: {
      name: "test2",
      email: "test2@test.com",
      password: "password",
    },
  }),
})
  .then((res) => {
    if (res.ok) {
      console.log(res.headers.get("Authorization"));
      localStorage.setItem("token", res.headers.get("Authorization"));
      return res.json();
    } else {
      throw new Error(res);
    }
  })
  .then((json) => console.dir(json))
  .catch((err) => console.error(err));`

  this command will generate a token and store it in the localStorage

- if you need to login as an existing user, use the below command with the correct email and password:
`fetch("http://127.0.0.1:3001/login", {
  method: "post",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    user: {
      email: "test1@test.com",
      password: "password",
    },
  }),
})
  .then((res) => {
    if (res.ok) {
      console.log(res.headers.get("Authorization"));
      localStorage.setItem("token", res.headers.get("Authorization"));
      return res.json();
    } else {
      throw new Error(res);
    }
  })
  .then((json) => console.dir(json))
  .catch((err) => console.error(err));`

  This command will store the token in the localStorage as well

- To create a new post, you need to pass your user id with the post's title and text, as in the below example:
`fetch("http://localhost:3001/users/3/posts.json", {
 method: "post",
  headers: {
    "Content-Type": "application/json",
    Authorization: localStorage.getItem("token"),
  },
 body: JSON.stringify({
    post: {
      title: "json_3rd",
	text: "json third post",
    },
  }),
});`

 This command should create a new post belongs to the loged user

- To list all posts for a given user, run the below command:
`fetch("http://localhost:3001/users/1/posts.json", {
  headers: {
    "Content-Type": "application/json",
    Authorization: localStorage.getItem("token"),
  },
})
  .then((res) => {
    if (res.ok) {
      return res.json();
    } else if (res.status == "401") {
      throw new Error("Unauthorized Request. Must be signed in.");
    }
  })
  .then((json) => console.dir(json))
  .catch((err) => console.error(err));`

  This command returns an array for the posts list

- To add a comment on a given post (id = 1) by the logged user, use the below command

`fetch("http://localhost:3001/users/1/posts/1/comments", {
 method: "post",
  headers: {
    "Content-Type": "application/json",
    Authorization: localStorage.getItem("token"),
  },
 body: JSON.stringify({
    comment: {
	text: "json first comment",
    },
  }),
});`

- To List all comments on a given post (e.g. post_id =1) use the below command

`fetch("http://localhost:3001/users/1/posts/1/comments.json", {
  headers: {
    "Content-Type": "application/json",
    Authorization: localStorage.getItem("token"),
  },
})
  .then((res) => {
    if (res.ok) {
      return res.json();
    } else if (res.status == "401") {
      throw new Error("Unauthorized Request. Must be signed in.");
    }
  })
  .then((json) => console.dir(json))
  .catch((err) => console.error(err));`

- Finaly to logout, use the below command:
`user logout
fetch("http://127.0.0.1:3001/logout", {
  method: "delete",
  headers: {
    "Content-Type": "application/json",
  Authorization: localStorage.getItem("token"),
  },
});`


### Run tests
- on your console run (rspec) command

## Author

👤 **Ja'fer Yousef**

- GitHub: [@githubhandle](https://github.com/jaferIdrees)
- Twitter: [@twitterhandle](https://twitter.com/jafel_l)
- LinkedIn: [LinkedIn](https://linkedin.com/in/jaferll)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jaferIdrees/blog_app/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse team

## 📝 License

This project is [MIT](./MIT.md) licensed.
