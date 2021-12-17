# Awesome Events (Back-End)!

## Live Version
- [Front-end live version](https://awesome-events.netlify.app)
- [Back-end API Live Version](https://awesome-events-back-end.herokuapp.com/)

## ERD
> ![ERD](./docs/ERD-Easy-Address.png)

## About

The main goals for this exercise are:

- Implement a connection between a Ruby on Rails back-end and ReactJS front-end.
- Understand the pros and cons of different approaches of connecting Ruby on Rails back-end with ReactJS front-end.
- Take a scheduling challenge imposed by the hatch company.

In this project, only the Ruby on Rails back-end part was implemented. The front-end part of the project can be found in [this repo](https://github.com/aristides1000/hatch-challenge-frontend).

## Built With

- Ruby on Rails
- RSpec
- PostgreSQL
- JWT
- Cloudinary
- VisualStudio Code, Git, & GitHub

## Pre-requisites

- Ruby (v. 3.0.1)
- Rails (v. 6.1.4)
- NodeJs (v. 14.17)
- YarnJs (v. 1.22.10)
- PostgreSQL (v. 12.8)
- Git

## Getting Started

1. In your terminal, in the folder of your preference, type the following bash command to clone this repository:

```sh
git clone git@github.com:aristides1000/hatch-challenge-backend.git
```

2. Now that you have already cloned the repo run the following commands to get the project up and running:

```sh
cd hatch-challenge-backend
bundle
rails db:create
rails db:migrate
```

3. Now, on your terminal, run:

```sh
rails server
```

This should start your local server in [http://localhost:3000/](http://localhost:3000/). Now, you can open the REST API client of your choice (Thunder Client extension for VScode is recommended) to fetch the data from the API.

## Live API endpoint
[https://awesome-events-back-end.herokuapp.com/](https://awesome-events-back-end.herokuapp.com/)

## API Endpoints
|                            Description                           |            Endpoint            | Method |                                                  Header                                                 | Body                                                                                                              |
|:----------------------------------------------------------------:|:------------------------------:|:------:|:-------------------------------------------------------------------------------------------------------:|-------------------------------------------------------------------------------------------------------------------|
|                              Sign Up                             |            `/users`            |  POST  | { "Accept": "application/json", "Content-Type": "application/json" }                                    | {"user": {"name": "Daniel", "email": "daniel@mail.com", "password": "123456", "password_confirmation": "123456"}} |
|                              Sign In                             |        `/users/sign_in`        |  POST  | { "Accept": "application/json", "Content-Type": "application/json" }                                    | {"user": {"email": "daniel@mail.com", "password": "123456"}}                                                      |
|                             Sign Out                             |        `/users/sign_out`       | DELETE | { "Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer <TOKEN>" } |                                                                                                                   |
|                 Fetch User Properties from Token                 |         `/logged_user`         |   GET  | { "Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer <TOKEN>" } |                                                                                                                   |
|                    Fetch all available addresses                    |            `/addresses`           |   GET  | { "Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer <TOKEN>" } |                                                                                                                   |
|                        Create a new address                        |            `/address`           |  POST  | { "Accept": "application/json", "Authorization": "Bearer <TOKEN>" }                                     | FormData(street: 'test', external_number: 'test', internal_number: 'test', postal_code: 'test', colony: 'test', municipality: 'test', city: 'test', state: 'test', country: 'test')                             |
| Delete an Event (Only the Event Creator can perform this action) |       `/addresses/:address_id`      | DELETE | { "Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer <TOKEN>" } |                                                                                                                   |
|                         Edit Reserve an address                         |         `/address`         |  PATCH  | { "Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer <TOKEN>" } | FormData(street: 'test', external_number: 'test', internal_number: 'test', postal_code: 'test', colony: 'test', municipality: 'test', city: 'test', state: 'test', country: 'test')                                      |

To stop the server, hit `<CTRL> + C` on your keyboard.

You can also find an API-consumer built with ReactJS in [this repo](https://github.com/aristides1000/hatch-challenge-frontend) that will display the front-end side application.

## Author 👤

👨‍💻 **Arístides José Molina Pérez**

- GitHub: [@aristides1000](https://github.com/aristides1000)
- Twitter: [@aristides_1000](https://twitter.com/@aristides_1000)
- LinkedIn: [aristides jose molina perez](https://www.linkedin.com/in/aristides-molina/)

## 🤝 Contributing