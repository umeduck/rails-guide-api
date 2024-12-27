FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile and install gems
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]