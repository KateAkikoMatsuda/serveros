#-------------------------------------------------------------------------
# Copyright (c) 2014 Apple Inc. All Rights Reserved.
#
# IMPORTANT NOTE: This file is licensed only for use on Apple-branded
# computers and is subject to the terms and conditions of the Apple Software
# License Agreement accompanying the package this file is a part of.
# You may not port this file to another platform without Apple's written consent.
#-------------------------------------------------------------------------

class ApnKnobSet < KnobSet

  @@payload_type          = "com.apple.apn.managed"
  @@payload_subidentifier = "apn"
  @@is_unique             = true
  @@payload_name          = "APN"

  #-------------------------------------------------------------------------

  def self.old_table_name
    return "apn_knob_sets"
  end

  #-------------------------------------------------------------------------

  def localized_payload_display_name(short = false)
    return I18n.t("apn_display_name")
  end

  #-------------------------------------------------------------------------

  def modify_payload_hash(payload_hash)
    # Move the DefaultsDomainName dictionary to where it belongs
    payload_hash['PayloadContent'][0]['DefaultsDomainName'] = payload_hash['PayloadContent'][1]['DefaultsDomainName']
    payload_hash['PayloadContent'].delete_at(1)
    return payload_hash
  end

  #-------------------------------------------------------------------------

end