class Country < ActiveRecord::Base
  has_many :country_interest
  has_many :abstract_leads
  has_many :leads
  has_many :addresses
  has_many :regions, :order => "name"
  has_one :vat_rate, :dependent => :destroy
  has_one :logo, :class_name => "Asset::CountryLogo", :as => :resource, :conditions => "asset_type = 'Asset::CountryLogo'", :dependent => :destroy
  has_one :email_template_signature, :as => :related

  validates_presence_of :name
  validates_uniqueness_of :name

  liquid :email_template_signature, :email_template_signature_logo_url

  check_associations_before_destroy :abstract_leads, :country_interest, :addresses, :vat_rate

  accepts_nested_attributes_for :regions, :allow_destroy => true
  accepts_nested_attributes_for :logo, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :email_template_signature

  scope :with_leads, select("DISTINCT(name), countries.*").joins("RIGHT JOIN leads on countries.id=leads.country_id")
  scope :with_leads_in_categories, lambda { |category_ids| with_leads.where("leads.category_id IN (?)", category_ids) }
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), countries.*").where("lead_purchases.requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_request_requested_by, lambda { |requested_by| select("DISTINCT(name), countries.*").where("lead_purchases.requested_by = ?", requested_by.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_owner, lambda { |owner| select("DISTINCT(name), countries.*").where("lead_purchases.requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL", owner.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_assignee, lambda { |assignee| select("DISTINCT(name), countries.*").where("lead_purchases.assignee_id = ? and accessible_from IS NOT NULL", assignee.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :within_accessible_categories, lambda { |supplier| where("leads.category_id NOT IN (?)", supplier.accessible_categories_ids) }

  after_save :create_email_template_signature_if_locale_present


  private

  def create_email_template_signature_if_locale_present
    if !locale.blank? and email_template_signature.nil?
      orig_locale = I18n.locale
      I18n.locale = locale
      EmailTemplateSignature.create(:related => self)
      I18n.locale = orig_locale
    end
  end

  public

  def email_template_signature_logo_url
    (logo and logo.id) ? logo.url : default_email_template_signature_logo_url
  end

  def default_email_template_signature_logo_url
    "https://static-fairleads.s3.amazonaws.com/images/logo_fairleads_with_border.jpg"
  end

  def default_bank_account
    BankAccount.country_default_bank_account(id).first
  end

  def to_i
    id
  end

  def to_s
    name
  end

  def phone_dialling_code
    code = PHONE_CODES.detect { |pc| pc.first == detailed_locale.to_s.upcase }
    code.nil? ? "" : code.last
  end

  def can_be_destroyed?
    send(:check_listed_associations_for_existing_objects)
  end

  def self.get_country_from_locale
    country = Thread.current[:globalize_detailed_locale].blank? ? nil : where(:detailed_locale => Thread.current[:globalize_detailed_locale]).first
    country = where(:locale => I18n.locale.to_s).first unless country
    country
  end

  PHONE_CODES = [
      ["AF", "93"], ["AL", "355"], ["DZ", "213"], ["AS", "1 684"], ["AD", "376"], ["AO", "244"], ["AI", "1 264"], ["AQ", "672"], ["AG", "1 268"],
      ["AR", "54"], ["AM", "374"], ["AW", "297"], ["AU", "61"], ["AT", "43"], ["AZ", "994"], ["BS", "1 242"], ["BH", "973"], ["BD", "880"],
      ["BB", "1 246"], ["BY", "375"], ["BE", "32"], ["BZ", "501"], ["BJ", "229"], ["BM", "1 441"], ["BT", "975"], ["BO", "591"], ["BA", "387"],
      ["BW", "267"], ["BR", "55"], ["IO", ""], ["VG", "1 284"], ["BN", "673"], ["BG", "359"], ["BF", "226"], ["MM", "95"], ["BI", "257"],
      ["KH", "855"], ["CM", "237"], ["CA", "1"], ["CV", "238"], ["KY", "1 345"], ["CF", "236"], ["TD", "235"], ["CL", "56"], ["CN", "86"],
      ["CX", "61"], ["CC", "61"], ["CO", "57"], ["KM", "269"], ["CK", "682"], ["CR", "506"], ["HR", "385"], ["CU", "53"], ["CY", "357"],
      ["CZ", "420"], ["CD", "243"], ["DA", "45"], ["DJ", "253"], ["DM", "1 767"], ["DO", "1 809"], ["EC", "593"], ["EG", "20"], ["SV", "503"],
      ["GQ", "240"], ["ER", "291"], ["EE", "372"], ["ET", "251"], ["FK", "500"], ["FO", "298"], ["FJ", "679"], ["FI", "358"], ["FR", "33"],
      ["PF", "689"], ["GA", "241"], ["GM", "220"], ["", "970"], ["GE", "995"], ["DE", "49"], ["GH", "233"], ["GI", "350"], ["GR", "30"],
      ["GL", "299"], ["GD", "1 473"], ["GU", "1 671"], ["GT", "502"], ["GN", "224"], ["GW", "245"], ["GY", "592"], ["HT", "509"], ["VA", "39"],
      ["HN", "504"], ["HK", "852"], ["HU", "36"], ["IS", "354"], ["IN", "91"], ["ID", "62"], ["IR", "98"], ["IQ", "964"], ["IE", "353"],
      ["IM", "44"], ["IL", "972"], ["IT", "39"], ["CI", "225"], ["JM", "1 876"], ["JP", "81"], ["JE", ""], ["JO", "962"], ["KZ", "7"],
      ["KE", "254"], ["KI", "686"], ["", "381"], ["KW", "965"], ["KG", "996"], ["LA", "856"], ["LV", "371"], ["LB", "961"], ["LS", "266"],
      ["LR", "231"], ["LY", "218"], ["LI", "423"], ["LT", "370"], ["LU", "352"], ["MO", "853"], ["MK", "389"], ["MG", "261"], ["MW", "265"],
      ["MY", "60"], ["MV", "960"], ["ML", "223"], ["MT", "356"], ["MH", "692"], ["MR", "222"], ["MU", "230"], ["YT", "262"], ["MX", "52"],
      ["FM", "691"], ["MD", "373"], ["MC", "377"], ["MN", "976"], ["ME", "382"], ["MS", "1 664"], ["MA", "212"], ["MZ", "258"], ["NA", "264"],
      ["NR", "674"], ["NP", "977"], ["NL", "31"], ["AN", "599"], ["NC", "687"], ["NZ", "64"], ["NI", "505"], ["NE", "227"], ["NG", "234"],
      ["NU", "683"], ["", "672"], ["KP", "850"], ["MP", "1 670"], ["NO", "47"], ["OM", "968"], ["PK", "92"], ["PW", "680"], ["PA", "507"],
      ["PG", "675"], ["PY", "595"], ["PE", "51"], ["PH", "63"], ["PN", "870"], ["PL", "48"], ["PT", "351"], ["PR", "1"], ["QA", "974"],
      ["CG", "242"], ["RO", "40"], ["RU", "7"], ["RW", "250"], ["BL", "590"], ["SH", "290"], ["KN", "1 869"], ["LC", "1 758"], ["MF", "1 599"],
      ["PM", "508"], ["VC", "1 784"], ["WS", "685"], ["SM", "378"], ["ST", "239"], ["SA", "966"], ["SN", "221"], ["RS", "381"], ["SC", "248"],
      ["SL", "232"], ["SG", "65"], ["SK", "421"], ["SI", "386"], ["SB", "677"], ["SO", "252"], ["ZA", "27"], ["KR", "82"], ["ES", "34"],
      ["LK", "94"], ["SD", "249"], ["SR", "597"], ["SJ", ""], ["SZ", "268"], ["SE", "46"], ["CH", "41"], ["SY", "963"], ["TW", "886"],
      ["TJ", "992"], ["TZ", "255"], ["TH", "66"], ["TL", "670"], ["TG", "228"], ["TK", "690"], ["TO", "676"], ["TT", "1 868"], ["TN", "216"],
      ["TR", "90"], ["TM", "993"], ["TC", "1 649"], ["TV", "688"], ["UG", "256"], ["UA", "380"], ["AE", "971"], ["GB", "44"], ["US", "1"],
      ["UY", "598"], ["VI", "1 340"], ["UZ", "998"], ["VU", "678"], ["VE", "58"], ["VN", "84"], ["WF", "681"], ["", "970"], ["EH", ""],
      ["YE", "967"], ["ZM", "260"], ["ZW", "263"]
  ]
end
