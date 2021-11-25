module ChildrenHelper
  def child_list(children)
    html = ""
    @children.each do |child|
      html += render( partial: "children", locals: { child: child } )
    end
    return raw(html)
  end
end
