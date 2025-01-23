module RailsAdmin
  module UserAdmin
    extend ActiveSupport::Concern

    included do
      rails_admin do
        list do
          field :id
          field :name
          field :email
          field :sign_in_count
          field :current_sign_in_at
          field :created_at
        end

        edit do
          field :name
          field :email
          field :nickname
          field :password do
            help 'Deixe em branco se não quiser alterar'
          end
          field :password_confirmation
          field :image
          field :allow_password_change
          field :challenge_group
        end

        show do
          field :id
          field :name
          field :email
          field :nickname
          field :image
          field :sign_in_count
          field :current_sign_in_at
          field :last_sign_in_at
          field :current_sign_in_ip
          field :last_sign_in_ip
          field :created_at
          field :updated_at
          field :challenge_group
          field :posts
        end

        exclude_fields :provider, :uid, :encrypted_password, 
                      :reset_password_token, :reset_password_sent_at,
                      :remember_created_at, :tokens
      end
    end
  end
end 