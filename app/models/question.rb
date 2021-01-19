class Question < ApplicationRecord
  belongs_to :subject,  inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  max_paginates_per 5

  #metodo de classe
  # def self.search(term,page) 
  #   includes(:answers)
  #           .where("lower(description) LIKE ?", "%#{term.downcase}%")
  #           .page(page)
  # end

  # def self.last_question(page)
  #   includes(:answers).order('created_at desc').page(page)
  # end

  #Scopes
    scope :search, -> (term,page){ 
    includes(:answers, :subject)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
    }

    scope :last_question, -> (page){
      includes(:answers).order('created_at desc').page(page)
    }

    scope :_search_subject_, -> (subject_id,page){ 
    includes(:answers)
            .where(subject_id: subject_id)
            .page(page)
    }

end
