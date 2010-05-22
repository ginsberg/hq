module AssetsHelper
  
  def add_scan(form_builder)
    link_to_function "add", :id  => "add_scan" do |page|
      form_builder.fields_for :scans, Scan.new, :child_index => 'NEW_RECORD' do |scan_form|
        html = render(:partial => 'scan', :locals => { :f => scan_form })
        page << "$('add_scan').insert({ before: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
  
  def delete_scan(form_builder)
    if form_builder.object.new_record?
      link_to_function("Remove this Photo", "this.up('fieldset').remove()")
    else
      form_builder.hidden_field(:_delete) +
      link_to_function("Remove this Photo", "this.up('fieldset').hide(); $(this).previous().value = '1'")
    end
  end
  
  
end
