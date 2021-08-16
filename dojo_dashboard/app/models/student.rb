class Student < ActiveRecord::Base
  belongs_to :dojo

  def self.joiner student_id
    self.joins(:dojo).where("students.id = ?", student_id).select(:id, :first_name, :last_name, :branch, :dojo_id, :created_at).first
  end

  def self.students student
    self.where("id != ? AND dojo_id = ? AND DATE(created_at) = ?", student.id, student.dojo_id, student.created_at.strftime("%Y-%m-%d"))
  end
end
