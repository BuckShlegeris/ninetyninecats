class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, :inclusion => { :in => %w(APPROVED DENIED PENDING)}
  validate :requests_must_not_overlap

  belongs_to :cat

  before_save :default_values
  def default_values
    self.status ||= 'PENDING'
  end

  attr_accessible :cat_id, :status, :start_date, :end_date

  def requests_must_not_overlap
    return if status != 'APPROVED'

    p ["overlaps are ",overlaps]

    conflict_count = overlaps.where("status = 'APPROVED'").count

    conflict_count -= 1 if persisted?

    if conflict_count > 0
      errors.add(:base, "There are #{conflict_count} conflicts")
    end
  end

  def overlaps
    CatRentalRequest
            .where("cat_id = ?", cat_id)
            .where("(start_date < ? AND end_date > ?)
               OR (start_date > ? AND start_date < ?)", start_date, start_date, start_date, end_date)
  end

  def deny!
    self.status = "DENIED"
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      overlaps.each do |overlap|
        overlap.deny!
      end
    end
  end

  def pending?
    self.status == "PENDING"
  end
end