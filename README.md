# README

## Installation

Requires Postgresql (v10.x), Redis, Ruby (v2.4.x), Node (v8.x.x), and Yarn (v1.3.x)

With Homebrew you can run the following

```bash
brew install postgresql redis, rbenv
rbenv install 2.4.1
```

And for the node dependencies I recommend using [nvm](https://github.com/creationix/nvm).

```bash
nvm install 8.0.0
npm install -g yarn
```

Once the dependencies are installed, run the following

```bash
bundle install
yarn install
foreman start
```
 
Then visit the development site at http://localhost:5000/