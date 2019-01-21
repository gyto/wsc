RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  config.parent_controller = 'ApplicationController'

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model Order do
    edit do
      field :status, :enum do
        enum do
          ['In Progress', 'Payment Required', 'Shipped', 'Delivered']
        end
      end
      field :print_type, :enum do
        required true
        enum do
          %w[Print Engraving]
        end
      end
      field :billing_type, :enum do
        required true
        enum do
          ['Pay In Full', 'Payment On Delivery']
        end
      end
      field :qty do
        required true
      end
      field :content do
        required true
      end
      field :user_id
      field :catalog_id
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
