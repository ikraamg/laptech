[![Contributors][contributors-shield]][contributors-url][![Forks][forks-shield]][forks-url][![Stargazers][stars-shield]][stars-url][![Issues][issues-shield]][issues-url]
[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Ikraam-Click%20to%20Contact-brightgreen)](mailto:consult.ikraam@gmail.com) [![Twitter Follow](https://img.shields.io/twitter/follow/GhoorIkraam?label=Follow%20Ikraam%20on%20Twitter&style=social)](https://twitter.com/GhoorIkraam)

# Tech Favourites
<!-- PROJECT LOGO -->

<br />
<p align="center">
  <a href="https://github.com/ikraamg/laptech.git">
    <p align="center"> <img src="https://user-images.githubusercontent.com/34813339/96689545-d0853880-1382-11eb-9371-9755f41a55b1.png" alt="react-redux" height="500">
    <img src="https://user-images.githubusercontent.com/34813339/96697115-d4698880-138b-11eb-944e-c004fff033f5.png" alt="react-redux" height="500"></p>
  </a>

  <h3 align="center">Tech favourites - Full-Stack Rails and React APP </h3>

  <p align="center">
    <a href="https://github.com/ikraamg/laptech/issues">Report a Bug or Request a Feature</a>
    ·
    <a href="https://tech-favourites.herokuapp.com/home">Live Demo</a>
  </p>
</p>

<!-- Live Link  -->

### [Live Demo Link](https://tech-favourites.herokuapp.com/home)

<br>
<!-- ABOUT THE PROJECT -->

## About The Project

This is a mobile-first full-stack app, [the front end](https://github.com/ikraamg/laptech) is a single page app that is built in React/Redux that communicates with the Ruby on Rails back-end via API requests that are secured by JWT authentication.

This repo contains the Rails back-end which function in API only mode. It handles authentication via JWT tokens and requires a token for all private requests.

The front-end can be found [here](https://github.com/ikraamg/techStore)

<!-- CONTROL'S -->
## Built With

- Rails
- RSpec
- JWT

## How to use

- Users can register and login to the account
- Users can view list of technology items and click to view full details.
- Users can favourite items and view a list of favourites

## [API](./doc/API.md)

Local Base URL is the url of the rails server, usually <http://localhost:3000>
The deployed base Url: <https://tech-store-rails.herokuapp.com>

### [Link to full API docs](./doc/API.md)

## ERD for Rails database

<p align="center">
  <a href="./doc/Techy.png"> <img src="./doc/Techy.png" alt="react-redux" height="350">
  </a>
</p>

### Installation

To run the app locally, clone the repository and navigate to it's directory:

```bash
https://github.com/ikraamg/laptech.git
cd laptech
git checkout api-feature
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

Now go to [localhost:3000](http://localhost:3000) in your browser.

### Automated Testing 🧪

The app was test with rspec and factoryBot and shoulda-matchers.

```bash
rspec
```

## "Nice To Have Requirements" that is Implemented

- Dark Mode via toggle
- Implement proper user authentication from the front-end to the server
- Create a user table in your database, so that a given user could only access the favourites they selected
- Make the app responsive, creating both tablet and desktop versions, following design guidelines
- You could implement transitions to make the user experience better
- Create full documentation for your API

## Potential Updates

- Users can message the creator of a tech-favourite
- A store like checkout system can be created

<!-- CONTACT -->

## Authors

👤 **Ikraam Ghoor**

- Github: [@ikraamg](https://github.com/ikraamg)
- Twitter: [@GhoorIkraam](https://twitter.com/GhoorIkraam)
- LinkedIn: [isghoor](https://linkedin.com/isghoor)
- Email: [consult.ikraam@gmail.com](mailto:consult.ikraam@gmail.com)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Design influenced by [Alexey Savitskiy on Behance](https://www.behance.net/alexey_savitskiy)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/ikraamg/react-redux.svg?style=flat-square
[contributors-url]: https://github.com/ikraamg/laptech/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ikraamg/react-redux.svg?style=flat-square
[forks-url]: https://github.com/ikraamg/laptech/network/members
[stars-shield]: https://img.shields.io/github/stars/ikraamg/react-redux.svg?style=flat-square
[stars-url]: https://github.com/ikraamg/laptech/stargazers
[issues-shield]: https://img.shields.io/github/issues/ikraamg/react-redux.svg?style=flat-square
[issues-url]: https://github.com/ikraamg/laptech/issues

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
