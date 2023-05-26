class Room < ApplicationRecord
    has_many :entries, dependent: :destroy
    has_many :messages, dependent: :destroy

    def messages
        return Message.where(room_id: self.id)
    end

    def entries
        return Entry.where(room_id: self.id)
    end

    def user
        return User.where(room_id: self.id)
    end

end
