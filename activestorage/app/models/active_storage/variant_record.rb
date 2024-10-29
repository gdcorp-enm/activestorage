# frozen_string_literal: true

class ActiveStorage::VariantRecord < ActiveStorage::Record
  belongs_to :blob
  has_one_attached :image

  before_create :sync_id_uuid

  def sync_id_uuid
    write_attribute(:id, SecureRandom.uuid) if read_attribute(:id).blank?
    write_attribute(:uuid, read_attribute(:id)) if read_attribute(:uuid).blank?
  end
end

ActiveSupport.run_load_hooks :active_storage_variant_record, ActiveStorage::VariantRecord
