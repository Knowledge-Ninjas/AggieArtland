class Badge < ApplicationRecord

    def self.check_all_badges(user)
        flash = ""
        
        Badge.all.each do |badge|
            if badge.will_complete(user)
                flash += badge.handle_complete(user)
            end
        end

        flash
    end

    def get_icon
        "https://cdn-icons-png.flaticon.com/512/3135/3135783.png"
    end

    def handle_complete(user)
        user.set_badge(self, true)
        return "\nYou've earned the badge '" + self.name + "'!"
    end

    def will_complete(user)

        if user.has_badge(self)
            return false
        end

        if self.badge_type == "stamps"
            req = self.requirement.to_i
            num = user.get_earned_stamps().length()

            return num >= req
        end

        return false

    end
    
    def get_progress(user)

        if user.has_badge(self)
            return "COMPLETE"
        end

        if self.badge_type == "stamps"
            req = self.requirement.to_i
            num = user.get_earned_stamps().length()

            return num.to_s + "/" + req.to_s
        end

        "unknown (misconfigured badge type!)"
        
    end

end
