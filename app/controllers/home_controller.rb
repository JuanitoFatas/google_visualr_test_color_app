class HomeController < ApplicationController
  def index
    data_table_3 = GoogleVisualr::DataTable.new
    data_table_3.new_column('string', 'Department'      )
    data_table_3.new_column('number', 'Revenues Change' )
    data_table_3.add_rows([
      ['Shoes'      , 10700 ],
      ['Sports'     , -15400],
      ['Toys'       , 12500 ],
      ['Electronics', -2100 ],
      ['Food'       , 22600 ],
      ['Art'        , 1100  ]
    ])

    formatter = GoogleVisualr::ColorFormat.new
    formatter.add_range( -20000, 0   , 'white' , 'orange'  )
    formatter.add_range( 20000 , nil , 'red'   , '#33ff33' )
    formatter.columns(1) # Apply to 2nd Column

    data_table_3.format(formatter)

    opts     = { :width => 600, :allowHtml => true, :showRowNumber => true }
    @chart_3 = GoogleVisualr::Interactive::Table.new(data_table_3, opts)
  end
end
