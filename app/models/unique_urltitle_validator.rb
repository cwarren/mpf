# this validator checks that the urltitle field is unique across both the MobileService and Service Package tables
class UniqueUrltitleValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)

    ms = MobileService.find_by_urltitle(value)
    if (ms)
      if (ms.id == record.id && record.class.to_s == "MobileService")
        return true
      else
        record.errors[attribute] << 'urltitle matches an existing service'
        return false
      end
    end
    
    sp = ServicePackage.find_by_urltitle(value)
    if (sp)
      if (sp.id == record.id && record.class.to_s == "ServicePackage")
        return true
      else
        record.errors[attribute] << 'urltitle matches an existing package'
        return false
      end
    end

    return true

  end

end