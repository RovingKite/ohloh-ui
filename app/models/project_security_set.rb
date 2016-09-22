class ProjectSecuritySet < ActiveRecord::Base
  has_many :releases
  has_many :vulnerabilities, -> { uniq }, through: :releases
  belongs_to :project

  def most_recent_releases
    @recent_releases_ ||= releases.order(released_on: :asc).last(10)
  end

  def most_recent_vulnerabilities
    @recent_vulnerabilities_ ||= most_recent_releases.map(&:vulnerabilities)
  end

  def most_recent_vulnerabilities?
    most_recent_releases.present? && most_recent_vulnerabilities.flatten.present?
  end
end
