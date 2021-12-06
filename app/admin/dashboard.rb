ActiveAdmin.register_page "Dashboard" do
  
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    #div class: "blank_slate_container", id: "dashboard_default_message" do
      #span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      #end
    #end
    @clubs = Club.all
    panel "Recent Clubs" do
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
              "Created At"
            end
            th do
              "Last transfers"
            end
          end
        end
        tbody do
          last_clubs = @clubs.last(2)
          last_clubs.each do |club|
            tr do
              td do
                club.id
              end
              td do
                link_to club.name, admin_club_path(club)
              end
              td do
                club.created_at
              end
              td do
                table do
                  thead do
                    tr do
                      th do
                        "Name"
                      end
                      th do
                        "Position"
                      end
                      th do
                        "Created At"
                      end
                    end
                  end
                  tbody do
                    club_players = club.players.last(2)
                    club_players.each do |player|
                      tr do
                        td do
                          link_to player.name, admin_player_path(player)
                        end
                        td do
                          player.position
                        end
                        td do
                          player.created_at
                        end
                      end
                    end
                  end
                end
              end
            end  
          end  
        end 
      end
      strong { link_to "View All Clubs", admin_clubs_path }
    end
      
        #club_players = club.players.last(2)
        #club_players.each do |player|
          #div do
            #player.name
          #end
        #end
      #end
      #strong { link_to "View All Clubs", admin_clubs_path }
    
    panel "Recent Players" do
      table_for Player.order("created_at desc").limit(2) do
        column :id
        column :name do |player|
          link_to player.name, admin_player_path(player)
        end
        column :created_at
      end
      strong { link_to "View All Players", admin_players_path }
    end

    panel "Recent Coaches" do
      table_for Coach.order("created_at desc").limit(2) do
        column :id
        column :name do |coach|
          link_to coach.name, admin_coach_path(coach)
        end
        column :created_at
      end
      strong { link_to "View All Coaches", admin_coaches_path }
    end
     
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
