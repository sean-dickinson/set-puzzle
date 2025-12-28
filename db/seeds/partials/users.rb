# frozen_string_literal: true

User.create_with(password: ENV.fetch('SEEDED_USER_EMAIL'))
    .find_or_create_by(email_address: ENV.fetch('SEEDED_USER_EMAIL'),
                       username: ENV.fetch('SEEDED_USERNAME')
    )
