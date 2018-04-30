# name: tokenize
# about: OST Plugin for Discourse
# version: 0.0.1
# authors: Kevin Corley
# url: https://github.com/kjcorley/tokenize
 
 gem 'ost-sdk-ruby', '0.9.2'
 
 register_asset "stylesheets/tokenize.scss"
 
 RETORT_PLUGIN_NAME ||= "tokenize".freeze
 
 enabled_site_setting :tokenize_enabled
 
after_initialize do    
   module ::Tokenize
     class Engine < ::Rails::Engine
       engine_name TOKENIZE_PLUGIN_NAME
       isolate_namespace Tokenize
     end
   end
 
   Environment = 'sandbox'
   Ost_kit_key = SiteSetting.retort_key
   Ost_kit_secret = SiteSetting.retort_secret
   Credentials = OSTSdk::Util::APICredentials.new(Ost_kit_key, Ost_kit_secret)
   ostTransactionKindObject = OSTSdk::Saas::TransactionKind.new(Environment, Credentials) # initializes a TransactionKind object
end
