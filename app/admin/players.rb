ActiveAdmin.register Player do
  index do
    column :id
    column :name
    column :club_id
    column :position
    column :number
    column :age
    column :country
    column :contract_until
    column :market_value, :sortable => :market_value do |player|          
      number_to_currency player.market_value, :unit => "€"          
    end
    column :created_at

    actions
  end

  show do
    attributes_table(:name, :club, :position, :number, :age, :country, :contract_until, :market_value)
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :club_id
      f.input :position
      f.input :number
      f.input :age
      f.input :country
      f.input :contract_until
      f.input :market_value, value: number_with_precision(:market_value, precision: 2), step: 0.05
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit player: [ :name, :club_id, :position, :number, :age, :country, :contract_until, :market_value ]
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :position, :number, :age, :country, :contract_until, :market_value, :cost_type, :club_id, :team
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :position, :number, :age, :country, :contract_until, :market_value, :cost_type, :club_id, :team]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
