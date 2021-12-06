ActiveAdmin.register Club do
   index do
    column :id
    column :name
    column :stadium
    column :tournament_position
    column :total_market_value, :sortable => :total_market_value do |club|
      div :class => "total_market_value" do
        number_to_currency club.total_market_value, :unit => "€"
      end
    end
    column :average_age do |club|
      number_with_precision club.average_age, precision: 2
    end
    column :titles
    column :country
    column :created_at

    actions
  end

  show do
    attributes_table(:id, :name)

    @club = Club.find(params[:id])
    panel 'Players' do
      table do
        thead do
          tr do
            th do
              "Id"
            end
            th do
              "Name"
            end
            th do
              "Position"
            end
            th do
              "Number"
            end
            th do
              "Age"
            end
            th do
              "Country"
            end
            th do
              "Contract until"
            end
            th do
              "Market value"
            end
          end
        end
        tbody do
          @club.players.each do |player|
            tr do
              td do
                player.id
              end
              td do
                player.name
              end
              td do
                player.position
              end
              td do
                player.number
              end
              td do
                player.age
              end
              td do
                player.country
              end
              td do
                player.contract_until
              end
              td do
                number_to_currency player.market_value, :unit => "€"
              end
              td do
                strong { link_to "Show", admin_player_path(player) }
              end
              td do
                strong { link_to "Edit", edit_admin_player_path(player) }
              end
              td do
                strong { link_to 'Destroy', admin_player_path(player), method: :delete, data: { confirm: 'Are you sure?' } }
              end
            end
          end
        end
      end
      strong { link_to "New player", new_admin_player_path }
    end

    panel 'Coach' do
      if (resource.coach)
        table_for resource.coach do
          column(:id)
          column(:name)
          column(:last_club)
          column(:age)
          column(:country)
          column(:appointed)
          column(:contract_until)
          column(:preferred_formation)
          column :avrg_coach_term do |coach|
            number_with_precision coach.avrg_coach_term, precision: 2
          end
          column :achievements do |coach|
            textarea do 
              coach.achievements
            end
          end    
        end
        strong { link_to "Edit coach", edit_admin_coach_path(resource.coach) }
        strong { link_to 'Delete coach', admin_coach_path(resource.coach), method: :delete, data: { confirm: 'Are you sure?' } }
      else
        strong { link_to "New coach", new_admin_coach_path }
      end
    end

  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :stadium
      f.input :tournament_position
      f.input :titles
      f.input :country
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit club: [ :name, :stadium, :tournament_position, :titles, :country ]
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :stadium, :total_market_value, :tournament_position, :average_age, :titles, :country, :cost_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :stadium, :total_market_value, :tournament_position, :average_age, :titles, :country, :cost_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end  
end
