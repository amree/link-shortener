# README

More documentation can be found at https://amree.dev/project-documentation

## Development

Clone this project locally (you need to be a team member for this):

```
git@gitlab.com:amree/link-shortener.git
```

Install dependencies:

```
bundle # for ruby gems
yarn # for npm packages
```

Setup credential key for development:

```
echo "2c59deee7207a721f2830545f27ce739" > config/credentials/development.key
```

Setup database for this time:

```
rails db:create && rails db:migrate
```

Run the server and webpack in two different terminal

```
rails s

./bin/webpack-dev-server
```

Run sidekiq so that we can process the IP of the visitor

```
sidekiq
```

Open [http://localhost:3000](http://localhost:3000) to play around with the app

## Deployment

We need to add you public key to the server, but once we've done that, we should
be able to deploy it using:

```
tomo deploy
```

## Servers

We're using these AWS Services:

- Amazon EC2 (t2.micro)
- Amazon RDS: PostgreSQL (db.t2.micro)
- Amazon ElastiCache: Redis (cache.t2.micro)
- Route 53

## Production

[https://amree.dev](https://amree.dev)
