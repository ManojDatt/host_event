## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======================   Last event Event


<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Event Notification <span class="caret"></span><span class="badge"><%= event_count%></span></a>
              <ul class="dropdown-menu">


              <% if friend_list1.present?%>
                  
                      <% friend_list1.each do |friend|%>
                      <%user=User.find(friend.friend_id)%>
                       <li class="list-group-item">Hoster: <%= user.name%><br>
                      Title: <%=user.events.last.title %><br>
                      Date : <%=user.events.last.date %>
                       </li>
                      <% end %>
                  
                  <% end%>

                  <% if friend_list2.present?%>
               
                      <% friend_list2.each do |friend|%>
                       <%user=User.find(friend.user_id)%>
                       <li class="list-group-item well">Hoster: <%= user.name%><br>
                        Title: <%=user.events.last.title %><br>
                      Date : <%=user.events.last.date %>

                       </li>
                      <% end %>
                  
                  <% end%>
              
               
              </ul>
        
       </li>
