ActiveAdmin.register Coach do
  index do
    column :id
    column :name
    column :club_id
    column :last_club
    column :age
    column :country
    column :appointed
    column :contract_until
    column :preferred_formation
    column number_with_precision(:avrg_coach_term, precision: 2)

    actions
  end

  show do
    attributes_table(:name, :club, :last_club, :age, :country, :appointed, :contract_until, :preferred_formation, number_with_precision(:avrg_coach_term, precision: 2), :achievements)
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :club_id
      f.input :last_club
      f.input :age
      f.input :country
      f.input :appointed
      f.input :contract_until
      f.input :preferred_formation
      f.input number_with_precision(:avrg_coach_term, precision: 2)
      f.input :achievements
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit coach: [ :name, :club_id, :last_club, :age, :country, :appointed, :contract_until, :preferred_formation, :avrg_coach_term, :achievements ]
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :contract_until, :age, :appointed, :preferred_formation, :avrg_coach_term, :club_id, :country, :last_club, :achievements
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :contract_until, :age, :appointed, :preferred_formation, :avrg_coach_term, :club_id, :country, :last_club, :achievements]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
