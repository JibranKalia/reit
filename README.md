# REIT Investment Tracker

A Rails application for tracking Real Estate Investment Trust (REIT) investments and monitoring progress towards financial goals.

## Features

- Track monthly REIT investments with actual amounts and dividends
- Monitor progress towards a $230,000 investment target
- Calculate monthly dividend income (11.5% annual rate)
- Project time to reach target based on monthly contributions
- User authentication and personalized investment tracking

## Requirements

- Ruby 3.x
- Rails 8.0.2
- SQLite3
- Node.js (for JavaScript bundling)

## Setup

1. Install dependencies:

```bash
bundle install
```

2. Setup database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

3. Install Tailwind CSS:

```bash
rails tailwindcss:install
```

## Development

Start the development server:

```bash
./bin/dev
```

Visit <http://localhost:3000>

```

Deploy with Kamal:
```bash
kamal deploy
```

## Database Schema

- **Users**: Authentication and user management
- **Investments**: Monthly investment records with target/actual amounts and dividends

## Technologies

- Rails 8.0.2
- Tailwind CSS for styling
- Stimulus.js for JavaScript
- Turbo for SPA-like navigation
- SQLite for database
- Bcrypt for authentication
