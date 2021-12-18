## Copy of https://github.com/a6b8/write-invoice-for-ruby-documentation/blob/gh-pages/__generate/struct/blocks.rb

module Blocks
    class Error < StandardError; end
    @options = {
        show__qr_code: {
            description: 'Show or Hide `QR Code` Image',
            selector: 'qr_code',
            position: [ 525, 265 ],
            section: :three,
            examples: [
                {
                    description: 'Hide Qr Code',
                    options: {
                        show__qr_code: false
                    }
                },
                {
                    description: 'Show Qr Code',
                    options: {
                        show__qr_code: true
                    }
                }
            ]
        },    
        show__sub_total: {
            description: 'Show or Hide `Sub Total`',
            selector: 'sub_total',
            position: [ 355, 463 ],
            section: :six,
            examples: [
                {
                    description: 'Hide Sub Total',
                    options: {
                        show__sub_total: false
                    }
                },
                {
                    description: 'Show Sub Total',
                    options: {
                        show__sub_total: true
                    }
                }
            ]
        },    
        show__shipping: {
            description: 'Show or Hide `Shipping Row`',
            selector: 'shipping',
            position: [ 355, 485 ],
            section: :six,
            examples: [
                {
                    description: 'Hide Shipping',
                    options: {
                        show__shipping: false
                    }
                },
                {
                    description: 'Show Shipping',
                    options: {
                        show__shipping: true
                    }
                }
            ]
        },    
        show__total_net: {
            description: 'Show or Hide `Total Net` Row',
            selector: 'total_net',
            position: [ 355, 506 ],
            section: :six,
            examples: [
                {
                    description: 'Hide Total Net',
                    options: {
                        show__total_net: false
                    }
                },
                {
                    description: 'Show Total Net',
                    options: {
                        show__total_net: true
                    }
                }
            ]
        },    
        show__vat: {
            description: 'Show or Hide `VAT` Row',
            selector: '_vat',
            position: [ 355, 528 ],
            section: :six,
            examples: [
                {
                    description: 'Hide VAT Row',
                    options: {
                        show__vat: false
                    }
                },
                {
                    description: 'Show VAT Row',
                    options: {
                        show__vat: true
                    }
                }
            ]
        },    
        show__total_gross: {
            description: 'Show or Hide `Total Gross` Row',
            selector: 'total_gross',
            position: [ 355, 550 ],
            section: :six,
            examples: [
                {
                    description: 'Hide Total Gross Row',
                    options: {
                        show__total_gross: false
                    }
                },
                {
                    description: 'Show Total Gross Row',
                    options: {
                        show__total_gross: true
                    }
                }
            ]
        },
        show__logo: {
            description: 'Show or Hide Logo. To set your Image path or base64 string visit [headline__image__src](../options/headline__image__src.html)',
            selector: 'logo',
            section: :header,
            examples: [
                {
                    description: 'Show Logo',
                    options: {
                        show__logo: true,
                        headline__image__src: '<<--ROOT-->__generate/files/templates/logo.png'
                    }
                }
            ]
        },
        show__watermark: {
            description: 'Show or Hide Watermark. To set watermark text visit [text__watermark](../options/text__watermark) ',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Hide Watermark',
                    options: {
                        show__watermark: false
                    }
                },
                {
                    description: 'Show Watermark',
                    options: {
                        show__watermark: true
                    }
                }
            ]
        },
        show__unencrypted: {
            description: 'Encrypt or unencrypt .pdf document. To set a password visit [Payload](../payload/#example) #example > document > encrypted',
            section: :header,
            examples: []
        },
        order: {
            description: 'Arrange Sections here. For more Informations see [Sections](../sections/)',
            section: :all,
            examples: [
                {
                    description: 'Remove following sections: `header`, `four`, `seven` and `eight`.',
                    options: {
                        order: [
                            { :name => :two, :move_down => [:style__sections__pad] }, 
                            { :name => :three, :move_down => [:style__sections__pad] },
                            { :name => :five, :move_down => [:style__sections__pad, :style__sections__pad] }, 
                            { :name => :six, :move_down => [ 0 ] }, 
                            { :name => :nine, :move_down => [:style__sections__pad] }
                        ]
                    }
                },
                {
                    description: 'Swap section `three` with `four`.',
                    options: {
                        order: [
                            { :name => :header, :move_down => [ 0 ] }, 
                            { :name => :two, :move_down => [:style__sections__pad] }, 
                            { :name => :four, :move_down => [:style__sections__pad, :style__sections__pad] }, 
                            { :name => :three, :move_down => [:style__sections__pad] }, 
                            { :name => :five, :move_down => [:style__sections__pad, :style__sections__pad] }, 
                            { :name => :six, :move_down => [ 0 ] }, 
                            { :name => :seven, :move_down => [:style__sections__pad, :style__sections__pad] }, 
                            { :name => :eight, :move_down => [:style__sections__pad] }, 
                            { :name => :nine, :move_down => [:style__sections__pad] }
                        ]
                    }
                }
            ]
        },    
        text__phone: {
            description: 'Set default text `Phone`. Note: Optional you can use Inline Formating.',
            selector: 'phone',
            position: [ 390, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__phone: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__phone: ''
                    }
                }
            ]
        },    
        text__mobile: {
            description: 'Set default text `Mobile`. Note: Optional you can use Inline Formating.',
            selector: 'mobile',
            position: [ 390, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__mobile: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__mobile: ''
                    }
                }
            ]
        },    
        text__email: {
            description: 'Set default text `Email`. Note: Optional you can use Inline Formating.',
            selector: 'email',
            position: [ 390, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__email: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__email: ''
                    }
                }
            ]
        },    
        text__website: {
            description: 'Set default text `Website`. Note: Optional you can use Inline Formating.',
            selector: 'website',
            position: [ 390, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__website: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__website: ''
                    }
                }
            ]
        },    
        text__tax_id: {
            description: 'Set default text `Tax ID`. Note: Optional you can use Inline Formating.',
            selector: 'tax_id',
            position: [ 165, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__tax_id: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__tax_id: ''
                    }
                }
            ]
        },    
        text__invoice: {
            description: 'Set default text `Invoice`. Note: Optional you can use Inline Formating.',
            selector: 'invoice',
            position: [ 20, 279 ],
            section: :three,
            examples: [
                {
                    description: 'Use Inline Formatting `bold <b>` and `underline <u>`.',
                    options: {
                        text__invoice: '<b>Bold</b> and <u>Underline</u>'
                    }
                },
                {
                    description: 'Hide Text',
                    options: {
                        text__invoice: ''
                    }
                }
            ]
        },    
        text__page_count: {
            description: 'Set Page count output here. Use `<page>` to show current page number and `<total>` to show sum of all pages.',
            selector: 'page_count',
            position: [ 530, 19 ],
            section: :header,
            examples: [
                {
                    description: 'Change Text to `of`.',
                    options: {
                        text__page_count: '<page> of <total> '
                    }
                },
                {
                    description: 'Show only `<page>`.',
                    options: {
                        text__page_count: 'Page: <page>'
                    }
                }
            ]
        },    
        text__articles__nr: {
            description: 'Set Headline Column `"Nr"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 20, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__nr: '<b>Nr</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__nr: '<u>Nr</u>'
                    }
                }
            ]
        },    
        text__articles__id: {
            description: 'Set Headline Column `"ID"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 65, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__id: '<b>ID</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__id: '<u>ID</u>'
                    }
                }
            ]
        },    
        text__articles__article: {
            description: 'Set Headline Column `"Article"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 125, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__article: '<b>Article</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__article: '<u>Article</u>'
                    }
                }
            ]
        },    
        text__articles__piece: {
            description: 'Set Headline Column `"Piece"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 385, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__piece: '<b>Piece</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__piece: '<u>Piece</u>'
                    }
                }
            ]
        },    
        text__articles__single: {
            description: 'Set Headline Column `"Single"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 442, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__single: '<b>Single</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__single: '<u>Single</u>'
                    }
                }
            ]
        },    
        text__articles__total: {
            description: 'Set Headline Column `"Total"` of Article Section in your preferred Language. Optional you can use Inline Formating.',
            selector: 'articles',
            position: [ 502, 374 ],
            section: :five,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__articles__total: '<b>Total</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__articles__total: '<u>Total</u>'
                    }
                }
            ]
        },
        text__total__sub_total: {
            description: 'Set Row `"Sub Total"` in the "Article" Section. For hiding the row see [show__sub_total](../options/show__sub_total)',
            selector: 'sub_total',
            position: [ 365, 463 ],
            section: :six,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__total__sub_total: '<b>Sub Total</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__total__sub_total: '<u>Sub Total</u>'
                    }
                }
            ]
        },    
        text__total__shipping: {
            description: 'Set Row `"Total Shipping"` in the "Article" Section. For hiding the row see [show__shipping](../options/show__shipping)',
            selector: 'shipping',
            position: [ 365, 485 ],
            section: :six,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__total__shipping: '<b>Total Shipping</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__total__shipping: '<u>Total Shipping</u>'
                    }
                }
            ]
        },    
        text__total__total_net: {
            description: 'Set Row `"Total Net"` in the "Article" Section. For hiding the row see [show__total_net](../options/show__total_net)',
            selector: 'total_net',
            position: [ 365, 506 ],
            section: :six,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__total__total_net: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__total__total_net: '<u>Underline</u>'
                    }
                }
            ]
        },    
        text__total__vat: {
            description: 'Set Row `"Total Vat"` in the "Article" Section. For hiding the row see [show__total_vat](../options/show__total_vat)',
            selector: '_vat',
            position: [ 365, 528 ],
            section: :six,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__total__vat: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__total__vat: '<u>Underline</u>'
                    }
                }
            ]
        },    
        text__total__total_gross: {
            description: 'Set Row `"Total Gross"` in the "Article" Section. For hiding the row see [show__total_gross](../options/show__total_gross)',
            selector: 'total_gross',
            position: [ 365, 550 ],
            section: :six,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__total__total_gross: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__total__total_gross: '<u>Underline</u>'
                    }
                }
            ]
        },    
        text__footer__left: {
            description: 'Set the `Headline` of Footer on the `Left` column',
            selector: 'footer-left',
            position: [ 10, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__footer__left: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__footer__left: '<u>Underline</u>'
                    }
                }
            ]
        },    
        text__footer__center: {
            description: 'Set the `Headline` of Footer on the `Center` column.',
            selector: 'footer-center',
            position: [ 165, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__footer__center: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__footer__center: '<u>Underline</u>'
                    }
                }
            ]
        },    
        text__footer__right: {
            description: 'Set the `Headline` of Footer on the `Right` column.',
            selector: 'footer-right',
            position: [ 390, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Bold `<b>` inline formatting.',
                    options: {
                        text__footer__right: '<b>Bold</b>'
                    }
                },
                {
                    description: 'Underline `<u>` inline formatting.',
                    options: {
                        text__footer__right: '<u>Underline</u>'
                    }
                }
            ]
        }, 
        text__watermark: {
            description: 'Set `watermark text`',
            section: :all,
            examples: [
                {
                    description: 'Change Text to `Demo`',
                    options: {
                        text__watermark: 'Demo'
                    }
                },
                {
                    description: 'Change Text to `Confidential` and set font size to 120',
                    options: {
                        text__watermark: 'Confidential',
                        style__watermark__font_size: 120
                    }
                }
            ]
        },
        style__document__format: {
            description: 'Set Format of the Document here. For more Information visit: [prawnpdf.org/docs/0.11.1/Prawn/Document/PageGeometry.html](https://prawnpdf.org/docs/0.11.1/Prawn/Document/PageGeometry.html)',
            selector: 'format',
            section: :all,
            examples: [
                {
                    description: 'Set to `"LETTER"`.',
                    options: {
                        style__document__format: 'LETTER'
                    }
                },
                {
                    description: 'Set to `"LEGAL"`.',
                    options: {
                        style__document__format: 'LEGAL'
                    }
                }
            ]
        },    
        style__page_count__align: {
            description: 'Set Page Count alignment',
            selector: 'page_count',
            position: [ 520, 19 ],
            section: :header,
            examples: [
                {
                    description: 'Set Alignment to `:center`.',
                    options: {
                        style__page_count__align: :center
                    }
                },
                {
                    description: 'Set Alignment to `:left`.',
                    options: {
                        style__page_count__align: :left
                    }
                }
            ]
        },    
        style__page_count__start_count_at: {
            description: 'Start to count from.',
            selector: 'page_count',
            position: [ 510, 19 ],
            section: :header,
            examples: [
                {
                    description: 'Start with `0`.',
                    options: {
                        style__page_count__start_count_at: 0
                    }
                },
                {
                    description: 'Start with `5`.',
                    options: {
                        style__page_count__start_count_at: 5
                    }
                }
            ]
        },    
        style__page_count__offset_y: {
            description: 'Set an `y offset` for page count string.',
            selector: 'page_count',
            position: [ 500, 19 ],
            section: :header,
            examples: [
                {
                    description: 'Set to `0`.',
                    options: {
                        style__page_count__offset_y: 0
                    }
                },
                {
                    description: 'Set to `50`.',
                    options: {
                        style__page_count__offset_y: 50
                    }
                }
            ]
        },    
        style__font__name: {
            description: 'Set standard `font name`.',
            selector: 'font',
            section: :all,
            examples: [
                {
                    description: 'Set font name to `RanaCom`.',
                    options: {
                        style__font__name: 'RanaCom',
                        style__font__family: { 
                            'RanaCom' => {
                              normal: '~/Library/Fonts/RanaCom-Regular.ttf',
                              italic: '~/Library/Fonts/RanaCom-Italic.ttf',
                              bold: '~/Library/Fonts/RanaCom-Bold.ttf',
                              bold_italic: '~/Library/Fonts/RanaCom-BlackItalic.ttf'
                            }
                        }
                    }
                }
            ]
        },
        style__font__family: {
            description: 'Set standard `font name`.',
            selector: 'font',
            section: :all,
            examples: [
                {
                    description: 'Set font name to `RanaCom`.',
                    options: {
                        style__font__name: 'RanaCom',
                        style__font__family: { 
                            'RanaCom' => {
                              normal: '~/Library/Fonts/RanaCom-Regular.ttf',
                              italic: '~/Library/Fonts/RanaCom-Italic.ttf',
                              bold: '~/Library/Fonts/RanaCom-Bold.ttf',
                              bold_italic: '~/Library/Fonts/RanaCom-BlackItalic.ttf'
                            }
                        }
                    }
                }
            ]
        }, 
        style__font__default: {
            description: 'Set default `font size`.',
            selector: 'font',
            section: :all,
            examples: [
                {
                    description: 'Set default font size to `20`.',
                    options: {
                        style__font__default: 9
                    }
                },
                {
                    description: 'Set default font size to `8`.',
                    options: {
                        style__font__default: 8
                    }
                }
            ]
        },    
        style__font__small: {
            description: 'Set small `font size`.',
            selector: 'font',
            section: :all,
            examples: [
                {
                    description: 'Set default font size to `10`.',
                    options: {
                        style__font__small: 4
                    }
                },
                {
                    description: 'Set default font size to `12`.',
                    options: {
                        style__font__small: 6
                    }
                }
            ]
        },    
        style__colors__background: {
            description: 'Set document background color (not full supported).',
            selector: 'background',
            section: :all,
            examples: [
                {
                    description: 'Set background color to `#E89B54`.',
                    options: {
                        style__colors__background: 'E89B54'
                    }
                },
                {
                    description: 'Set background color to `#372372`.',
                    options: {
                        style__colors__background: '372372'
                    }
                }
            ]
        },    
        style__colors__header__default: {
            description: 'Set background color for header section',
            selector: 'color',
            position: [ 20, 20 ],
            section: :header,
            examples: [
                {
                    description: 'Set header default color to `#E89B54`.',
                    options: {
                        style__colors__header__default: 'E89B54'
                    }
                },
                {
                    description: 'Set header default color to `#372372`.',
                    options: {
                        style__colors__header__default: '372372'
                    }
                }
            ]
        },    
        style__colors__rows__even: {
            description: 'Set color for `even rows` in the article section.',
            selector: 'color',
            position: [ 30, 432 ],
            section: :five,
            examples: [
                {
                    description: 'Set background color to `#DCDCDC`.',
                    options: {
                        style__colors__rows__even: 'DCDCDC'
                    }
                },
                {
                    description: 'Set default font size to `#9181AD`.',
                    options: {
                        style__colors__rows__even: '9181AD'
                    }
                }
            ]
        },    
        style__colors__rows__odd: {
            description: 'Set color for `even rows` in the article section.',
            selector: 'color',
            position: [ 30, 402 ],
            section: :five,
            examples: [
                {
                    description: 'Set background color to `#DCDCDC`.',
                    options: {
                        style__colors__rows__odd: 'DCDCDC'
                    }
                },
                {
                    description: 'Set default font size to `#9181AD`.',
                    options: {
                        style__colors__rows__odd: '9181AD'
                    }
                }
            ]
        },    
        style__header__height: {
            description: 'Set total height of header section.',
            selector: 'header',
            position: [ 20, 30 ],
            section: :header,
            examples: [
                {
                    description: 'Set background color to `#DCDCDC`.',
                    options: {
                        style__header__height: 120
                    }
                },
                {
                    description: 'Set default font size to `#9181AD`.',
                    options: {
                        style__header__height: 50
                    }
                }
            ]
        },    
        style__address_label__offset_x: {
            description: 'Set `x offset` for address label to adjust position for envelopes with window.',
            selector: 'address',
            position: [ 20, 141 ],
            section: :two,
            examples: [
                {
                    description: 'Set offset to `100`.',
                    options: {
                        style__address_label__offset_x: 100
                    }
                },
                {
                    description: 'Set offset to `0`.',
                    options: {
                        style__address_label__offset_x: 0
                    }
                }
            ]
        },    
        style__address_label__move_down_one: {
            description: 'Set distance between sender and receiver.',
            selector: 'address',
            position: [ 20, 156 ],
            section: :two,
            examples: [
                {
                    description: 'Move down by `30`.',
                    options: {
                        style__address_label__move_down_one: 30
                    }
                },
                {
                    description: 'Move down `0`.',
                    options: {
                        style__address_label__move_down_one: 0
                    }
                }
            ]
        },    
        style__address_label__move_down_two: {
            description: 'Set distance between address label and next section.',
            selector: 'address',
            position: [ 20, 206 ],
            section: :two,
            examples: [
                {
                    description: 'Move down by `30`.',
                    options: {
                        style__address_label__move_down_two: 30
                    }
                },
                {
                    description: 'Move down `0`.',
                    options: {
                        style__address_label__move_down_two: 0
                    }
                }
            ]
        },    
        style__footer__height: {
            description: 'Set total height of footer section.',
            selector: 'footer',
            position: [ 20, 756 ],
            section: :all,
            examples: [
                {
                    description: 'Set height to `100`.',
                    options: {
                        style__footer__height: 100
                    }
                },
                {
                    description: 'Set height to `30`.',
                    options: {
                        style__footer__height: 150
                    }
                }
            ]
        },    
        style__footer__border_width: {
            description: 'Set border width which differs footer and section before.',
            selector: 'footer',
            position: [ 30, 756 ],
            section: :footer,
            examples: [
                {
                    description: 'Set border width to `0`.',
                    options: {
                        style__footer__border_width: 0
                    }
                },
                {
                    description: 'Set border width to `6`.',
                    options: {
                        style__footer__border_width: 6
                    }
                }
            ]
        },    
        style__footer__borders: {
            description: 'Set border type which differs footer and section before.',
            selector: 'footer',
            position: [ 10, 756 ],
            section: :footer,
            examples: [
                {
                    description: 'Change border style to `:left`.',
                    options: {
                        style__footer__borders: [ :left ]
                    }
                },
                {
                    description: 'Change border style to `:right` and `:top`.',
                    options: {
                        style__footer__borders: [ :right, :top ]
                    }
                }
            ]
        },    
        style__sections__pad: {
            description: 'Set default padding between sections.',
            selector: 'format',
            section: :all,
            examples: [
                {
                    description: 'Set default pad to `0`.',
                    options: {
                        style__sections__pad: 0
                    }
                },
                {
                    description: 'Set default pad to `60`.',
                    options: {
                        style__sections__pad: 60
                    }
                }
            ]
        },    
        style__articles__nr__align: {
            description: 'Set align of Article `"Nr"` column.',
            selector: 'articles',
            position: [ 30, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "Nr" to `:right`.',
                    options: {
                        style__articles__nr__align: :right
                    }
                },
                {
                    description: 'Set alignment of "Nr" to `:center`.',
                    options: {
                        style__articles__nr__align: :center
                    }
                }
            ]
        },    
        style__articles__nr__width: {
            description: 'Set width of Article `"Nr"` column.',
            selector: 'articles',
            position: [ 30, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "Nr" to `20`.',
                    options: {
                        style__articles__nr__width: 20
                    }
                },
                {
                    description: 'Set width of "Nr" to `60`.',
                    options: {

                        style__articles__nr__width: 40
                    }
                }
            ]
        },    
        style__articles__id__align: {
            description: 'Set alignment of Article `"ID"` column.',
            selector: 'articles',
            position: [ 75, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "ID" to `:right`.',
                    options: {
                        style__articles__id__align: :right
                    }
                },
                {
                    description: 'Set alignment of "ID" to `:center`.',
                    options: {
                        style__articles__id__align: :center
                    }
                }
            ]
        },    
        style__articles__id__width: {
            description: 'Set width of Article `"ID"` column.',
            selector: 'articles',
            position: [ 75, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "ID" to `20`.',
                    options: {
                        style__articles__id__width: 20
                    }
                },
                {
                    description: 'Set width of "ID" to `60`.',
                    options: {
                        style__articles__id__width: 60
                    }
                }
            ]
        },    
        style__articles__article__align: {
            description: 'Set alignment of Article `"Article"` column.',
            selector: 'articles',
            position: [ 135, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "article" to `:right`.',
                    options: {
                        style__articles__article__align: :right
                    }
                },
                {
                    description: 'Set alignment of "article" to `:center`.',
                    options: {
                        style__articles__article__align: :center
                    }
                }
            ]
        },    
        style__articles__article__width: {
            description: 'Set width of Article `"Article"` column.',
            selector: 'articles',
            position: [ 135, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "article" to `20`.',
                    options: {
                        style__articles__article__width: 200
                    }
                },
                {
                    description: 'Set width of "article" to `60`.',
                    options: {
                        style__articles__article__width: 150
                    }
                }
            ]
        },    
        style__articles__piece__align: {
            description: 'Set alignment of Article `"Piece"` column.',
            selector: 'piece',
            position: [ 395, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "piece" to `:right`.',
                    options: {
                        style__articles__piece__align: :right
                    }
                },
                {
                    description: 'Set alignment of "piece" to `:center`.',
                    options: {
                        style__articles__piece__align: :center
                    }
                }
            ]
        },    
        style__articles__piece__width: {
            description: 'Set width of Article `"Piece"` column.',
            selector: 'piece',
            position: [ 395, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "piece" to `20`.',
                    options: {
                        style__articles__piece__width: 20
                    }
                },
                {
                    description: 'Set width of "piece" to `60`.',
                    options: {
                        style__articles__piece__width: 60
                    }
                }
            ]
        },    
        style__articles__single__align: {
            description: 'Set alignment of Article `"Single"` column.',
            selector: 'single',
            position: [ 452, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "Single" to `:right`.',
                    options: {
                        style__articles__single__align: :right
                    }
                },
                {
                    description: 'Set alignment of "Single" to `:center`.',
                    options: {
                        style__articles__single__align: :center
                    }
                }
            ]
        },    
        style__articles__single__width: {
            description: 'Set width of Article `"Single"` column.',
            selector: 'single',
            position: [ 452, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "single" to `20`.',
                    options: {
                        style__articles__single__width: 20
                    }
                },
                {
                    description: 'Set width of "single" to `60`.',
                    options: {
                        style__articles__single__width: 60
                    }
                }
            ]
        },    
        style__articles__single__format: {
            description: 'Set Format Type of Article `"Single"` column.',
            selector: 'single',
            position: [ 452, 396 ],
            section: :five,
            examples: [
                {
                    description: 'Set currency format to `long`.',
                    options: {
                        style__articles__single__format: :format_types__currency__long
                    }
                }
            ]
        },    
        style__articles__total__align: {
            description: 'Set alignement of Article `"Total"` column.',
            selector: 'total',
            position: [ 512, 369 ],
            section: :five,
            examples: [
                {
                    description: 'Set alignment of "Total" to `:right`.',
                    options: {
                        style__articles__total__align: :right
                    }
                },
                {
                    description: 'Set alignment of "Total" to `:center`.',
                    options: {
                        style__articles__total__align: :center
                    }
                }
            ]
        },    
        style__articles__total__width: {
            description: 'Set width of Article `"Total"` column.',
            selector: 'total',
            position: [ 512, 379 ],
            section: :five,
            examples: [
                {
                    description: 'Set width of "Total" to `20`.',
                    options: {
                        style__articles__total__width: 20
                    }
                },
                {
                    description: 'Set width of "Total" to `60`.',
                    options: {
                        style__articles__total__width: 60
                    }
                }
            ]
        },    
        style__articles__total__format: {
            description: 'Set Format Type of Article `"Total"` column.',
            selector: 'total',
            position: [ 512, 396 ],
            section: :five,
            examples: [
                {
                    description: 'Set currency format to `long`.',
                    options: {
                        style__articles__total__format: :format_types__currency__long
                    }
                }
            ]
        },    
        style__total__sub_total__borders: {
            description: 'Set border type of `"Sub Total"` Area in "Article" Section.',
            selector: 'sub_total',
            position: [ 507, 463 ],
            section: :six,
            examples: [
                {
                    description: 'Set border style to `:bottom`.',
                    options: {
                        style__total__sub_total__borders: [ :left, :right ]
                    }
                },
                {
                    description: 'Set border style to `:left`.',
                    options: {
                        style__total__sub_total__borders: [ :top, :left ]
                    }
                }
            ]
        },    
        style__total__sub_total__border_width: {
            description: 'Set border width of `"Sub Total"` Area in "Article" Section.',
            selector: 'sub_total',
            position: [ 497, 463 ],
            section: :six,
            examples: [
                {
                    description: 'Set border width to `4`.',
                    options: {
                        style__total__sub_total__border_width: 4
                    }
                },
                {
                    description: 'Set border width to `10`.',
                    options: {
                        style__total__sub_total__border_width: 10
                    }
                }
            ]
        },    
        style__total__shipping__borders: {
            description: 'Set border type of `"Shipping"` Area in "Article" Section.',
            selector: 'shipping',
            position: [ 507, 485 ],
            section: :six,
            examples: [
                {
                    description: 'Set border style to `:bottom`.',
                    options: {
                        style__total__shipping__borders: [ :left, :right ]
                    }
                },
                {
                    description: 'Set border style to `:left`.',
                    options: {
                        style__total__shipping__borders: [ :top, :left ]
                    }
                }
            ]
        },    
        style__total__shipping__border_width: {
            description: 'Set border width of `"Shipping"` Area in "Article" Section.',
            selector: 'shipping',
            position: [ 497, 485 ],
            section: :six,
            examples: [
                {
                    description: 'Set border width to `4`.',
                    options: {
                        style__total__shipping__border_width: 4
                    }
                },
                {
                    description: 'Set border width to `10`.',
                    options: {
                        style__total__shipping__border_width: 10
                    }
                }
            ]
        },    
        style__total__total_net__borders: {
            description: 'Set border type of `"Total Net"` Area in "Article" Section.',
            selector: 'total_net',
            position: [ 507, 506 ],
            section: :six,
            examples: [
                {
                    description: 'Set border style to `:bottom`.',
                    options: {
                        style__total__total_net__borders: [ :left, :right ]
                    }
                },
                {
                    description: 'Set border style to `:left`.',
                    options: {
                        style__total__total_net__borders: [ :top, :left ]
                    }
                }
            ]
        },    
        style__total__total_net__border_width: {
            description: 'Set border type of `"Total Net"` Area in "Article" Section.',
            selector: 'total_net',
            position: [ 497, 506 ],
            section: :six,
            examples: [
                {
                    description: 'Set border width to `4`.',
                    options: {
                        style__total__total_net__border_width: 4
                    }
                },
                {
                    description: 'Set border width to `10`.',
                    options: {
                        style__total__total_net__border_width: 10
                    }
                }
            ]
        },    
        style__total__vat__borders: {
            description: 'Set border type of `"VAT"` Area in "Article" Section.',
            selector: 'vat',
            position: [ 507, 528 ],
            section: :six,
            examples: [
                {
                    description: 'Set border style to `:bottom`.',
                    options: {
                        style__total__vat__borders: [ :left, :right ]
                    }
                },
                {
                    description: 'Set border style to `:left`.',
                    options: {
                        style__total__vat__borders: [ :top, :left ]
                    }
                }
            ]
        },    
        style__total__vat__border_width: {
            description: 'Set border width of `"VAT"` Area in "Article" Section.',
            selector: 'vat',
            position: [ 497, 528 ],
            section: :six,
            examples: [
                {
                    description: 'Set border width to `4`.',
                    options: {
                        style__total__vat__border_width: 4
                    }
                },
                {
                    description: 'Set border width to `10`.',
                    options: {
                        style__total__vat__border_width: 10
                    }
                }
            ]
        },    
        style__total__total_gross__borders: {
            description: 'Set border type of `"Total Gross"` Area in "Article" Section.',
            selector: 'total_gross',
            position: [ 507, 550 ], 
            section: :six,
            examples: [
                {
                    description: 'Set border style to `:bottom`.',
                    options: {
                        style__total__total_gross__borders: [ :left, :right ]
                    }
                },
                {
                    description: 'Set border style to `:left`.',
                    options: {
                        style__total__total_gross__borders: [ :top, :left ]
                    }
                }
            ]
        },    
        style__total__total_gross__border_width: {
            description: 'Set border width of `"Total Gross"` Area in "Article" Section.',
            selector: 'total_gross',
            position: [ 497, 550 ], 
            section: :six,
            examples: [
                {
                    description: 'Set border width to `4`.',
                    options: {
                        style__total__total_gross__border_width: 4
                    }
                },
                {
                    description: 'Set border width to `10`.',
                    options: {
                        style__total__total_gross__border_width: 10
                    }
                }
            ]
        },    
        style__qr_code__width: {
            description: 'Set `QR Code` width (and height).',
            selector: 'qr_code',
            position: [ 525, 255 ],
            section: :three,
            examples: [
                {
                    description: 'Set qr code width to `20`.',
                    options: {
                        style__qr_code__width: 20
                    }
                },
                {
                    description: 'Set qr code width to `100`.',
                    options: {
                        style__qr_code__width: 100
                    }
                }
            ]
        },
        style__watermark__rotate: {
            description: 'Set `rotation of watermark`.',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Change rotation to `10`',
                    options: {
                        show__watermark: true,
                        style__watermark__rotate: 10  
                    }
                },
                {
                    description: 'Change rotation to `180` and set text to `Confidential` and re-adjust font size.',
                    options: {
                        show__watermark: true,
                        text__watermark: 'Confidential',
                        style__watermark__font_size: 180,
                        style__watermark__rotate: 10  
                    }
                }
            ]
        },
        style__watermark__fill_color: {
            description: 'Set `rotation of watermark`.',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Change fill color to `Red: #FF0000`',
                    options: {
                        show__watermark: true,
                        style__watermark__fill_color: 'FF0000'
                    }
                },
                {
                    description: 'Change fill color to `Lime: #00FF00` and change transparency to `0.2`',
                    options: {
                        show__watermark: true,
                        style__watermark__fill_color: 'FF0000',
                        style__watermark__transparency: 0.2
                    }
                }
            ]
        },
        style__watermark__font_size: {
            description: 'Set `font size` of watermark.',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Change `font size` to `40`.',
                    options: {
                        show__watermark: true,
                        style__watermark__font_size: 40
                    }
                },
                {
                    description: 'Change `font size` to `40`.',
                    options: {
                        show__watermark: true,
                        text__watermark: 'Demo',
                        style__watermark__font_size: 200
                    }
                }
            ]
        },
        style__watermark__font_family: {
            description: 'Set `font family`.',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Change font family to `Courier`',
                    options: {
                        style__watermark__font_family: 'Courier'
                    }
                },
                {
                    description: 'Change font family to `Helvetica`',
                    options: {
                        style__watermark__font_family: 'Helvetica'
                    }
                }
            ]
        },
        style__watermark__transparency: {
            description: 'Set watermark `transparency`.',
            selector: 'watermark',
            section: :all,
            examples: [
                {
                    description: 'Change transparency to `0.5`',
                    options: {
                        style__watermark__transparency: 0.25
                    }
                },
                {
                    description: 'Change transparency to `0.2`',
                    options: {
                        style__watermark__transparency: 0.15
                    }
                }
            ]
        },
        format_types__currency__short: {
            description: 'Define Format Type for viewing currency values in a `short form`.',
            selector: 'currency',
            position: [ [ 487, 550 ], [ 487, 528 ], [ 487, 506 ], [ 487, 485 ], [ 487, 463 ], [ 502, 430 ], [ 502, 396 ] ],
            section: :all,
            examples: [
                {
                    description: 'Change currency symbol to `"¥"`.',
                    options: {
                        format_types__currency__short: 
                            { delimiter: '.', separator: ',', precision: 2, unit: '', format: '%n ¥' },
                    }
                },
                {
                    description: 'Change currency symbol to `"$"`.',
                    options: {
                        format_types__currency__short: 
                            { delimiter: '.', separator: ',', precision: 2, unit: '', format: '%n $' },
                    }
                }
            ]
        },    
        format_types__currency__long: {
            description: 'Define Format Type for viewing currency values in a `long form`.',
            selector: 'currency',
            position: [ 222, 575 ],
            section: :seven,
            examples: [
                {
                    description: 'Change currency to `"USD"`.',
                    options: {
                        format_types__currency__long: 
                            { delimiter: '.', separator:',', precision: 2, unit: '', format: '%n USD' }
                    }
                },
                {
                    description: 'Change currency to `"YEN"`.',
                    options: {
                        format_types__currency__long: 
                            { delimiter: '.', separator:',', precision: 2, unit: '', format: '%n YEN' }
                    }
                }           
            ]
        },    
        format_types__date__eu: {
            description: 'Define Format Type for viewing date values for the `EU region`.',
            selector: 'currency',
            position: [ 20, 267 ],
            section: :three,
            examples: [
                {
                    description: 'Display date in `US Style`.',
                    options: {
                        format_types__date__eu: { strf: '%m/%d/%Y' } 
                    }
                },
                {
                    description: 'Display date with `Weeknumber`.',
                    options: {
                        format_types__date__eu: { strf: '%d.%m.%Y - Week: %V' } 
                    }
                }
            ]
        },    
        format_types__date__short: {
            description: 'Define Format Type for viewing date values in a `short form`. (As default not in use)',
            selector: 'currency',
            position: [ -1, -1 ],
            section: :all,
            examples: []
        },    
        format_types__date__default: {
            description: 'Define Format Type for viewing date values by `default`.',
            selector: 'currency',
            position: [ [ 408, 325 ], [ 482, 325 ] ],
            section: :all,
            examples: [
                {
                    description: 'Display date in `US Style`.',
                    options: {
                        format_types__date__default: { strf: '%m/%d/%Y' }
                    }
                },
                {
                    description: 'Display date in `EU Style`.',
                    options: {
                        format_types__date__default: { strf: '%d.%m.%Y' }
                    }
                }
            ]
        },    
        format_types__date__long: {
            description: 'Define Format Type for viewing date values in a `long form`.',
            selector: 'currency',
            position: [ 332, 575 ],
            section: :all,
            examples: [
                {
                    description: 'Display date in `EU Style`.',
                    options: {
                        format_types__date__long: { strf: '%A %d.%B.%Y %H:%M UTC' }
                    }
                },
                {
                    description: 'Display date is `US Style`.',
                    options: {
                        format_types__date__long: { strf: '%A %m/%d/%Y %I:%M%p UTC' }
                    }
                }
            ]
        },    
        format_types__date__year: {
            description: 'Define Format Type for showing `only the year`. (As default not in use)',
            selector: 'currency',
            position: [ -1, -1 ],
            section: :all,
            examples: []
        },    
        sections__nine__left_headline: {
            description: 'Set Headline of the `left footer` column.',
            selector: 'footer',
            position: [ 30, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` headline.',
                    options: {
                        sections__nine__left_headline: {
                                content: nil, 
                                struct: "<u><<--a-->></u>", 
                                assigns: [
                                    { value: :obj__text__footer__left, format: nil }
                                ]
                            }
                    }
                },
                {
                    description: 'Change pointer to `:obj__text__footer__center`.',
                    options: {
                        sections__nine__left_headline: {
                                content: nil, 
                                struct: "<b><<--a-->></b>", 
                                assigns: [
                                    { value: :obj__text__footer__center, format: nil }
                                ]
                            }
                    }
                }
            ]
        },    
        sections__nine__left_one: {
            description: 'Set the `first row` of the left footer column.',
            selector: 'footer',
            position: [ 30, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__left_one: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__address__name, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__left_one: {
                                content: nil, 
                                struct: "<b>Test:</b> <<--a-->>", 
                                assigns: [
                                    { value: :payload__from__address__name, format: nil }
                                ]
                            }
                    }
                }
            ]
        },    
        sections__nine__left_two: {
            description: 'Set the `second row` of the left footer column.',
            selector: 'footer',
            position: [ 30, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__left_two: {
                                content: nil, 
                                struct: "<u><<--a-->></u>", 
                                assigns: [
                                    { value: :payload__from__address__street, format: nil }
                                ]
                            }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__left_two: {
                                content: nil, 
                                struct: "<b>Test:</b> <<--a-->>", 
                                assigns: [
                                    { value: :payload__from__address__street, format: nil }
                                ]
                            }
                    }
                }
            ]
        },    
        sections__nine__left_three: {
            description: 'Set the `third row` of the left footer column.',
            selector: 'footer',
            position: [ 30, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__left_three: {
                                content: nil, 
                                struct: "<u><<--a-->></u>", 
                                assigns: [
                                    { value: :payload__from__address__city, format: nil }
                                ]
                            }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__left_three: {
                                content: nil, 
                                struct: "<b>Test:</b> <<--a-->>", 
                                assigns: [
                                    { value: :payload__from__address__city, format: nil }
                                ]
                            }
                    }
                }
            ]
        },    
        sections__nine__left_four: {
            description: 'Set the `fourth row` of the left footer column.',
            selector: 'footer',
            position: [ 30, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline text.',
                    options: {
                        sections__nine__left_four: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__address__country, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__left_four: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__address__country, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__center_headline: {
            description: 'Set Headline of the `center footer column`.',
            selector: 'footer-center',
            position: [ 185, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` headline.',
                    options: {
                        sections__nine__center_headline: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :obj__text__footer__center, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Change pointer to `:obj__text__footer__left`.',
                    options: {
                        sections__nine__center_headline: {
                            content: nil, 
                            struct: "<b><<--a-->></b>", 
                            assigns: [
                                { value: :obj__text__footer__left, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__center_one: {
            description: 'Set the `first row` of the center footer column.',
            selector: 'footer-center',
            position: [ 185, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__center_one: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__bank__name, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__center_one: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__bank__name, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__center_two: {
            description: 'Set the `second row` of the center footer column.',
            selector: 'footer-center',
            position: [ 185, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__center_two: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__bank__iban, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__center_two: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__bank__iban, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__center_three: {
            description: 'Set the `third row` of the center footer column.',
            selector: 'footer-center',
            position: [ 185, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__center_three: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__bank__bic, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test`.',
                    options: {
                        sections__nine__center_three: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__bank__bic, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__center_four: {
            description: 'Set the `fourth row` of the center footer column.',
            selector: 'footer-center',
            position: [ 185, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__center_four: {
                            content: nil, 
                            struct: "<u><<--a-->></u> <<--b-->>", 
                            assigns: [
                                { value: :obj__text__tax_id, format: nil }, 
                                { value: :payload__from__tax_id, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `ID`.',
                    options: {
                        sections__nine__center_four: {
                            content: nil, 
                            struct: "<u>ID:</u> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__tax_id, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__right_headline: {
            description: 'Set Headline of the right footer column.',
            selector: 'footer-right',
            position: [ 410, 766 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` headline.',
                    options: {
                        sections__nine__right_headline: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :obj__text__footer__right, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Change pointer to: `:obj__text__footer__left`.',
                    options: {
                        sections__nine__right_headline: {
                            content: nil, 
                            struct: "<b><<--a-->></b>", 
                            assigns: [
                                { value: :obj__text__footer__left, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__right_one: {
            description: 'Set the `first row` of the right footer column.',
            selector: 'footer-right',
            position: [ 410, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__right_one: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__contact__phone, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__right_one: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__contact__phone, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__right_two: {
            description: 'Set the second row of the right footer column.',
            selector: 'footer-right',
            position: [ 410, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__right_two: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__contact__mobile, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__right_two: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__contact__mobile, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__right_three: {
            description: 'Set the `third row` of the right footer column.',
            selector: 'footer-right',
            position: [ 410, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__right_three: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__contact__email, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test`.',
                    options: {
                        sections__nine__right_three: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__contact__email, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__nine__right_four: {
            description: 'Set the `fourth row` of the right footer column.',
            selector: 'footer-right',
            position: [ 410, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__nine__right_four: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__from__contact__website, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__nine__right_four: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__from__contact__website, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__eight__snippet: {
            description: 'Define text for section eight.',
            selector: 'snippet',
            position: [ 30, 615 ],
            section: :eight,
            examples: [
                {
                    description: 'Make text `bold <b>`.',
                    options: {
                        sections__eight__snippet: {
                            content: nil, 
                            struct: "Thank you for <b>not</b> using <<--a-->> Services.\n\n\nSincerely,\n\n<<--a-->>", 
                            assigns: [
                                { value: :payload__from__address__name, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__eight__snippet: {
                            content: nil, 
                            struct: "Thank you for using <u><<--a-->> Services</u>.\n\n\nSincerely,\n\n<<--a-->>", 
                            assigns: [
                                { value: :payload__from__address__name, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__seven__snippet: {
            description: 'Define text for section `seven`.',
            selector: 'snippet',
            position: [ 30, 578 ],
            section: :seven,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__seven__snippet: {
                            content: nil, 
                            struct: " We will debit your bank account for <u><<--a-->></u> on <<--b-->>. Please ensure you have sufficient funds in your bank account to avoid service disruptions.", 
                            assigns: [
                                { value: :payload__items__total_gross, format: :obj__format_types__currency__long }, 
                                { value: :payload__date__billing, format: :obj__format_types__date__long }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert `:payload__to__tax_id, format`.',
                    options: {
                        sections__seven__snippet: {
                            content: nil, 
                            struct: " We will debit your bank account for <b><<--a-->></b> (ID: <<--c-->>) on <<--b-->>. Please ensure you have sufficient funds in your bank account to avoid service disruptions.", 
                            assigns: [
                                { value: :payload__items__total_gross, format: :obj__format_types__currency__long }, 
                                { value: :payload__date__billing, format: :obj__format_types__date__long },
                                { value: :payload__to__tax_id, format: nil }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__six__sub_total: {
            description: 'Define text for area `"Sub Total"` in section "six".',
            selector: 'sub_total',
            position: [ 345, 463 ],
            section: :six,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__six__sub_total: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__items__sub_total, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__six__sub_total: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__items__sub_total, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__six__shipping: {
            description: 'Define text for area `"Shipping"` in section "six".',
            selector: 'shipping',
            position: [ 345, 485 ],
            section: :six,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__six__shipping: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__items__shipping_fee, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__six__shipping: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__items__shipping_fee, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__six__total_net: {
            description: 'Define text for area `"Total Net"` in section "six".',
            selector: 'total_net',
            position: [ 345, 506 ],
            section: :six,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__six__total_net: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__items__total_net, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__six__total_net: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__items__total_net, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__six__vat: {
            description: 'Define text for area `"Vat"` in section "six".',
            selector: 'vat',
            position: [ 345, 528 ],
            section: :six,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__six__vat: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__items__vat, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__six__vat: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__items__vat, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__six__total_gross: {
            description: 'Define text for area `"Total Gross"` in section "six".',
            selector: 'total_gross',
            position: [ 345, 550 ],
            section: :six,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__six__total_gross: {
                            content: nil, 
                            struct: "<u><<--a-->></u>", 
                            assigns: [
                                { value: :payload__items__total_gross, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                },
                {
                    description: 'Insert text: `Test:`.',
                    options: {
                        sections__six__total_gross: {
                            content: nil, 
                            struct: "<b>Test:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__items__total_gross, format: :obj__format_types__currency__short }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__four__snippet: {
            description: 'Define text for section "four".',
            selector: 'snippet',
            position: [ 30, 305 ],
            section: :four,
            examples: [
                {
                    description: 'Change Date format type to `"EU"`.',
                    options: {
                        sections__four__snippet: {
                            content: nil, 
                            struct: "Greetings from <<--a-->>,\n\nThis is a <u>demo invoice</u> for usage of <<--a-->> services for billing period <b><<--b-->> - <<--c-->></b>.",
                            assigns: [
                                { value: :payload__from__address__name, format: nil },
                                { value: :payload__date__period__from, format: :obj__format_types__date__eu }, 
                                { value: :payload__date__period__to, format: :obj__format_types__date__eu }
                            ]
                        }
                    }
                },
                {
                    description: 'Change Date format type to `"US"`.',
                    options: {
                        format_types__date__default: { strf: '%m/%d/%Y' },
                        sections__four__snippet: {
                            content: nil, 
                            struct: "Greetings from <<--a-->>,\n\nThis is a <u>demo invoice</u> for usage of <<--a-->> services for billing period <b><<--b-->> - <<--c-->></b>.",
                            assigns: [
                                { value: :payload__from__address__name, format: nil },
                                { value: :payload__date__period__from, format: :obj__format_types__date__default }, 
                                { value: :payload__date__period__to, format: :obj__format_types__date__default }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__three__qr_code: {
            description: 'Define text for `"QR Code"` in section "three".',
            selector: 'qr_code',
            position: [ 525, 275 ],
            section: :three,
            examples: [
                {
                    description: 'Add `#test-123` to url.',
                    options: {
                        sections__three__qr_code: {
                            content: nil, 
                            struct: "<<--a-->>#test-123",
                            assigns: [
                                { value: :payload__meta__qr_code, format: nil }
                            ]
                        }
                    }  
                },
                {
                    description: 'Insert `VCard`.',
                    options: {
                        sections__three__qr_code: {
                            content: nil, 
                            struct: "BEGIN:VCARD VERSION:3.0 N:User;Test FN:Test User ORG:13p4 Organisation TITLE:Title [title] REV:20121015T195243Z END:VCARD",
                            assigns: []
                        }
                    }  
                }
            ]
        },    
        sections__three__date: {
            description: 'Define `date` in section "three"',
            selector: 'date',
            position: [ 30, 267 ],
            section: :three,
            examples: [
                {
                    description: 'Insert text: `Date:`.',
                    options: {
                        sections__three__date: {
                            content: nil, 
                            struct: "<b>Date:</b> <<--a-->>", 
                            assigns: [
                                { value: :payload__date__invoice, format: :obj__format_types__date__eu }
                            ]
                        }
                    }
                },
                {
                    description: 'Change date to `"US" Style`.',
                    options: {
                        format_types__date__default: { strf: '%m/%d/%Y' },
                        sections__three__date: {
                            content: nil, 
                            struct: "<<--a-->>", 
                            assigns: [
                                { value: :payload__date__invoice, format: :obj__format_types__date__default }
                            ]
                        }
                    }
                }
            ]
        },    
        sections__three__headline: {
            description: 'Define `headlinev in section "three".',
            selector: 'snippet',
            position: [ 30, 279 ],
            section: :three,
            examples: [
                {
                    description: 'Change text to: `ID:`.',
                    options: {
                        sections__three__headline: {
                            content: nil,
                            struct: "<b><<--a-->>, ID: <<--b-->></b>",
                            assigns: [
                                { value:  :obj__text__invoice, format: nil}, 
                                { value: :payload__meta__id, format: nil}
                            ]
                        } 
                    }
                },
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__three__headline: {
                            content: nil,
                            struct: "<u><<--a-->></u> | ID: <<--b-->>",
                            assigns: [
                                { value:  :obj__text__invoice, format: nil}, 
                                { value: :payload__meta__id, format: nil}
                            ]
                        } 
                    }
                }
            ]
        },    
        sections__two__small: {
            description: 'Define address label (from) in section "two"',
            selector: 'snippet',
            position: [ 30, 141 ],
            section: :two,
            examples: [
                {
                    description: 'Modify text to `bold <b>`.',
                    options: {
                        sections__two__small: {
                            content: nil,
                            struct: "<b><<--a-->> - <<--b-->> - <<--c-->></b>",
                            assigns: [
                                { value: :payload__from__address__name, format: nil }, 
                                { value: :payload__from__address__street, format: nil }, 
                                { value: :payload__from__address__city, format: nil }
                            ]
                        } 
                    }
                },
                {
                    description: 'Insert Text: `Sender`.',
                    options: {
                        sections__two__small: {
                            content: nil,
                            struct: "Sender: <<--a-->> - <<--b-->> - <<--c-->>",
                            assigns: [
                                { value: :payload__from__address__name, format: nil }, 
                                { value: :payload__from__address__street, format: nil }, 
                                { value: :payload__from__address__city, format: nil }
                            ]
                        } 
                    }
                }
            ]
        },    
        sections__two__to: {
            description: 'Define address label (to) in section "two"',
            selector: 'snippet',
            position: [ 30, 156 ],
            section: :two,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__two__to: {
                            content: nil,
                            struct: "\t\t<u><<--a-->></u>\n<<--b-->>\n<<--c-->>\nTax ID: <<--d-->>",
                            assigns: [
                                { value: :payload__to__address__name, format: nil },
                                { value: :payload__to__address__street, format: nil },
                                { value: :payload__to__address__city, format: nil },
                                { value: :payload__to__tax_id, format: nil }
                            ]
                        } 
                    }
                },
                {
                    description: 'Modify text `<u>`.',
                    options: {
                        sections__two__to: {
                            content: nil,
                            struct: "\t\t<u><<--a-->></u>\n<<--b-->>\n<<--c-->>",
                            assigns: [
                                { value: :payload__to__address__name, format: nil },
                                { value: :payload__to__address__street, format: nil },
                                { value: :payload__to__address__city, format: nil }
                            ]
                        } 
                    }
                }
            ]
        },    
        sections__one__name: {
            description: 'Define text in section "one" (header)',
            selector: 'snippet',
            position: [ 385, 45 ],
            section: :header,
            examples: [
                {
                    description: 'Underline `<u>` text.',
                    options: {
                        sections__one__name: {
                            content: nil,
                            struct: "<u><<--a-->></u>\n<<--b-->>\n<<--c-->>\n<<--d-->>",
                            assigns: [
                                { value: :payload__from__address__name, format: nil },
                                { value: :payload__from__address__phrase, format: nil },
                                { value: :payload__from__address__city, format: nil },
                                { value: :payload__from__address__country, format: nil }
                            ]
                        }
                    }
                },
                {
                    description: 'Modify text.',
                    options: {
                        sections__one__name: {
                            content: nil,
                            struct: "<u><<--a-->></u>\n<<--b-->>",
                            assigns: [
                                { value: :payload__from__address__name, format: nil },
                                { value: :payload__from__address__phrase, format: nil },
                            ]
                        }
                    }
                }
            ]
        },    
        headline__grid__x: {
            description: 'Set grid size on the `x axis`.',
            selector: 'headline',
            position: [ 30, 20 ],
            section: :header,
            examples: []
        },    
        headline__grid__y: {
            description: 'Set grid size on the `y axis`.',
            selector: 'headline',
            position: [ 30, 30 ],
            section: :header,
            examples: []
        },    
        headline__default__content: {
            description: '`Autofill` every cell with content if you wish.',
            selector: 'headline',
            position: [ 30, 40 ],
            section: :header,
            examples: [
                {
                    description: 'Change default content to `-`.',
                    options: {
                        headline__default__content: '-'
                    }
                },
                {
                    description: 'Change default content to `.`.',
                    options: {
                        headline__default__content: '.'
                    }
                } 
            ]
        },    
        headline__default__style: {
            description: 'Set `font style` as a reference.',
            selector: 'headline',
            position: [ 30, 50 ],
            section: :header,
            examples: [
                {
                    description: 'Change default to: `:style__font__small`.',
                    options: {
                        headline__default__style: :style__font__small
                    }
                },
                {
                    description: 'Change default to: `:style__font__default`.',
                    options: {
                        headline__default__style: :style__font__default
                    }
                }
            ]
        },    
        headline__default__align: {
            description: 'Set default aligment behaviour of text.',
            selector: 'headline',
            position: [ 20, 40 ],
            section: :header,
            examples: [
                {
                    description: 'Change default header alignment to `:left`.',
                    options: {
                        headline__default__align: :left
                    }
                },
                {
                    description: 'Change default header alignment to `:center`.',
                    options: {
                        headline__default__align: :center
                    }
                }                
            ]
        },    
        headline__default__text_color: {
            description: 'Set `default text` color in section "one" (headline).',
            selector: 'snippet',
            position: [ 20, 50 ],
            section: :header,
            examples: [
                {
                    description: 'Change color to rows `even` to `:style__colors__rows__even`.',
                    options: {
                        headline__default__text_color: :style__colors__rows__even
                    }
                },
                {
                    description: 'Change color to rows `odd` to `:style__colors__rows__odd`.',
                    options: {
                        headline__default__text_color: :style__colors__rows__odd
                    }
                }                
            ]
        },    
        headline__default__borders: {
            description: 'Set `border type` in section "one" (headline).',
            selector: 'headline',
            position: [ 20, 60 ],
            section: :header,
            examples: [
                {
                    description: 'Change headline border type to `:right`.',
                    options: {
                        headline__default__borders: [:right]
                    }
                },
                {
                    description: 'Change headline border type to `:left` and `:right`.',
                    options: {
                        headline__default__borders: [:left, :right]
                    }
                } 
            ]
        },    
        headline__default__border_width: {
            description: 'Set `border width` in section "one" (headline).',
            selector: 'headline',
            position: [ 30, 60 ],
            section: :header,
            examples: [
                {
                    description: 'Change border width to `5`.',
                    options: {
                        headline__default__border_width: 5
                    }
                },
                {
                    description: 'Change border width to `10`.',
                    options: {
                        headline__default__border_width: 10
                    }
                } 
            ]
        },    
        headline__image__src: {
            description: 'Set local `image path` for company logo, use .png or .jpg',
            selector: 'logo',
            position: [ 20, 70 ],
            section: :header,
            examples: [
                {
                    description: 'Show Logo',
                    options: {
                        show__logo: true,
                        headline__image__src: '<<--ROOT-->__generate/files/templates/logo.png'
                    }
                }
            ]
        },    
        headline__image__colspan: {
            description: 'Set how many cells in the `columns (x)` direction should be merge to show the image.',
            selector: 'logo',
            position: [ 30, 70 ],
            section: :header,
            examples: []
        },    
        headline__image__rowspan: {
            description: 'Set how many cells in the `rows (y)` direction should be merge to show the image.',
            selector: 'logo',
            position: [ 20, 80 ],
            section: :header,
            examples: []
        },    
        headline__image__grid: {
            description: 'Set start position `[ columns x, rows y ]` of image.',
            selector: 'logo',
            position: [ 30, 80 ],
            section: :header,
            examples: []
        },    
        headline__image__borders: {
            description: 'Set `border type` of image cell.',
            selector: 'logo',
            position: [ 20, 90 ],
            section: :header,
            examples: []
        },    
        headline__image__fit: {
            description: 'Use `fit size` to adjust the image.',
            selector: 'logo',
            position: [ 30, 90 ],
            section: :header,
            examples: []
        },    
        headline__image__border_width: {
            description: 'Set `border width` of image cell.',
            selector: 'logo',
            position: [ 20, 100 ],
            section: :header,
            examples: []
        },    
        headline__texts: {
            description: 'Set a reference to `string data`.',
            selector: 'snippet',
            position: [ 30, 100 ],
            section: :header,
            examples: []
        },    
        footer__left__one: {
            description: 'Set a reference for `"left"` "footer" section to a formatted string.',
            selector: 'footer-left',
            position: [ 20, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__left_two__content`.',
                    options: {
                        footer__left__one: :sections__nine__left_two__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__left_one: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__left__one: :sections__nine__left_one__content
                    }
                }
            ]
        },    
        footer__left__two: {
            description: 'Set a reference for `"left"` "footer" section to a formatted string.',
            selector: 'footer-left',
            position: [ 20, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__left_one__content`.',
                    options: {
                        footer__left__two: :sections__nine__left_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__left_two: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__left__two: :sections__nine__left_two__content
                    }
                }
            ]
        },    
        footer__left__three: {
            description: 'Set a reference for `"left"` "footer" section to a formatted string.',
            selector: 'footer-left',
            position: [ 20, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__left_one__content`.',
                    options: {
                        footer__left__three: :sections__nine__left_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__left_three: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__left__three: :sections__nine__left_three__content
                    }
                }
            ]
        },    
        footer__left__four: {
            description: 'Set a reference for `"left"` "footer" section to a formatted string.',
            selector: 'footer-left',
            position: [ 20, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__left_one__content`.',
                    options: {
                        footer__left__four: :sections__nine__left_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__left_four: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__left__four: :sections__nine__left_four__content
                    }
                }
            ]
        },    
        footer__center__one: {
            description: 'Set a reference for `"center"` "footer" section to a formatted string.',
            selector: 'footer-center',
            position: [ 175, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__center_two__content`.',
                    options: {
                        footer__center__one: :sections__nine__center_two__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__center_one: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__center__one: :sections__nine__center_one__content
                    }
                }                
            ]
        },    
        footer__center__two: {
            description: 'Set a reference for `"center"` "footer" section to a formatted string.',
            selector: 'footer-center',
            position: [ 175, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__center_one__content`.',
                    options: {
                        footer__center__two: :sections__nine__center_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__center_two: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__center__two: :sections__nine__center_two__content
                    }
                }  
            ]
        },    
        footer__center__three: {
            description: 'Set a reference for `"center"` "footer" section to a formatted string.',
            selector: 'footer-center',
            position: [ 175, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__center_one__content`.',
                    options: {
                        footer__center__three: :sections__nine__center_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__center_three: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__center__three: :sections__nine__center_three__content
                    }
                }  
            ]
        },    
        footer__center__four: {
            description: 'Set a reference for `"center"` "footer" section to a formatted string.',
            selector: 'footer-center',
            position: [ 175, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__center_one__content`.',
                    options: {
                        footer__center__four: :sections__nine__center_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__center_four: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__center__four: :sections__nine__center_four__content
                    }
                }  
            ]
        },    
        footer__right__one: {
            description: 'Set a reference for `"right"` "footer" section to a formatted string.',
            selector: 'footer-right',
            position: [ 400, 776 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__right_two__content`.',
                    options: {
                        footer__right__one: :sections__nine__right_two__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__right_one: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__right__one: :sections__nine__right_one__content
                    }
                }  
            ]
        },    
        footer__right__two: {
            description: 'Set a reference for `"right"` "footer" section to a formatted string.',
            selector: 'footer-right',
            position: [ 400, 786 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__right_one__content`.',
                    options: {
                        footer__right__two: :sections__nine__right_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__right_two: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__right__two: :sections__nine__right_two__content
                    }
                }  
            ]
        },    
        footer__right__three: {
            description: 'Set a reference for `"right"` "footer" section to a formatted string.',
            selector: 'footer-right',
            position: [ 400, 796 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__right_one__content`.',
                    options: {
                        footer__right__three: :sections__nine__right_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__right_three: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__right__three: :sections__nine__right_three__content
                    }
                }  
            ]
        },    
        footer__right__four: {
            description: 'Set a reference for `"right"` "footer" section to a formatted string.',
            selector: 'footer-right',
            position: [ 400, 806 ],
            section: :footer,
            examples: [
                {
                    description: 'Change pointer to: `:sections__nine__right_one__content`.',
                    options: {
                        footer__right__four: :sections__nine__right_one__content
                    }
                },
                {
                    description: 'Change Text to: `""`.',
                    options: {
                        sections__nine__right_four: {
                            content: nil, 
                            struct: "", 
                            assigns: []
                        },
                        footer__right__four: :sections__nine__right_four__content
                    }
                }  
            ]
        }
    }

    @payloads = {
        meta__id: {
            position: [ [ 135, 279 ] ],
            section: :three,
            selector: 'payloads'
        },
        meta__qr_code: {
            position: [ 575, 255 ],
            section: :three,
            selector: 'payloads'
        },
        date__period__from: {
            position: [ [ 418, 325 ] ],
            section: :four,
            selector: 'payloads'
        },
        date__period__to: {
            position: [ 492, 325 ] ,
            section: :four,
            selector: 'payloads'
        },
        date__invoice: {
            position: [ 135, 269 ],
            section: :three,
            selector: 'payloads'
        },
        date__billing: {
            position: [ 342, 575 ],
            section: :seven,
            selector: 'payloads'
        },
        from__address__name: {
            position: [ 
                [ 300, 141 ], [ 570, 46 ], [ 200, 311 ], [ 225, 325 ], [ 160, 608 ], [ 110, 678 ],
                [ 145, 776 ]
            ],
            section: :all,
            selector: 'payloads'
        },
        from__address__phrase: {
            position:  [ 570, 56 ],
            section: :header,
            selector: 'payloads'
        },
        from__address__street: {
            position: [ [ 310, 141 ], [ 145, 786 ] ],
            section: :all,
            selector: 'payloads'
        },
        from__address__city: {
            position:  [ [ 145, 796 ], [ 570, 66 ], [ 320, 141 ] ],
            section: :all,
            selector: 'payloads'
        },
        from__address__country: {
            position:  [ [ 570, 76 ], [ 145, 806 ] ],
            section: :all,
            selector: 'payloads'
        },
        from__bank__name: {
            position:  [ [ 365, 776 ] ],
            section: :footer,
            selector: 'payloads'
        },
        from__bank__iban: {
            position:  [ 365, 786 ],
            section: :footer,
            selector: 'payloads'
        },
        from__bank__bic: {
            position: [ 365, 796 ],
            section: :footer,
            selector: 'payloads'
        },
        from__contact__phone: {
            position:  [ 575, 776 ],
            section: :footer,
            selector: 'payloads'
        },
        from__contact__mobile: {
            position:  [ 575, 786 ],
            section: :footer,
            selector: 'payloads'
        },
        from__contact__email: {
            position:  [ 575, 796 ],
            section: :footer,
            selector: 'payloads'
        },
        from__contact__website: {
            position:  [ 575, 806 ],
            section: :footer,
            selector: 'payloads'
        },
        from__tax_id: {
            position:  [ 365, 806 ],
            section: :footer,
            selector: 'payloads'
        },
        to__address__name: {
            position: [ 200, 156 ],
            section: :two,
            selector: 'payloads'
        },
        to__address__street: {
            position: [ 200, 168 ],
            section: :two,
            selector: 'payloads'
        },
        to__address__city: {
            position: [ 200, 179 ],
            section: :two,
            selector: 'payloads'
        },
        to__address__country: {
            position: [ -1, -1 ],
            section: :two,
            selector: 'payloads'
        },
        to__tax_id: {
            position: [ 200, 190 ],
            section: :two,
            selector: 'payloads'
        },
        items__articles: {
            position: [ [ 575, 396 ], [ 575, 430 ] ],
            section: :five,
            selector: 'payloads'
        },
        items__sub_total: {
            position: [ 575, 463 ],
            section: :six,
            selector: 'payloads'
        },
        items__shipping_fee: {
            position: [ 575, 485 ],
            section: :six,
            selector: 'payloads'
        },
        items__total_net: {
            position: [ 575, 506 ],
            section: :six,
            selector: 'payloads'
        },
        items__vat: {
            position: [ 575, 528 ],
            section: :six,
            selector: 'payloads'
        },
        items__total_gross: {
            position: [ 575, 550 ],
            section: :six,
            selector: 'payloads'
        }
    }
    
    @sections = {
        header: {
            description: 'The origin position of this section is on top of the page and can include a logo and other company defaults.',
            crop: '0x570! +000+000'
        },
        two: {
            description: 'The origin position of this section is based below "header" and contains the address field of the receiver.',
            crop: '0x390! +000+530'
        },
        three: {
            description: 'The origin position of this section is based below address field and contains two text field on the left and a qr code field on the right. ',
            crop: '0x390! +000+880'
        },
        four: {
            description: 'The origin position of this section is based above of the product list and contains a multiline text field. ',
            crop: '0x290! +000+1220'
        },
        five: {
            description: 'The origin position of this section is based above the product summary and include a table with services and prices.',
            crop: '0x460! +000+1450'
        },
        six: {
            description: 'The origin position of this section is based below the product detail section and include subtotal, shipping, total... ',
            crop: '0x580! +000+1850'
        },
        seven: {
            description: 'The origin position of this section is based below the two product section and include a text field. ',
            crop: '0x215! +000+2350'
        },
        eight: {
            description: 'The origin position of this section is based above the footer include a text field.',
            crop: '0x645! +000+2500'
        },
        footer: {
            description: 'The origin position of this section is based on the bottom as "footer". You have a table with 3 columns and 4 rows to include your data.',
            crop: '0x645! +000+3080'
        }
    }

    @meta = {
        url: 'https://docs.invoice-builder.com',
        regexs: [
            {
                name: 'Boolean',
                regex: "^(?:true\|false)",
                description: 'Allow true or false as value.'
            },
            {
                name: 'String',
                regex: '^[a-zA-Z0-9_]*$',
                description: 'Allow A-Z, a-b and 0-9 as value.'
            },
            {
                name: 'Integer',
                regex: '^[1-9]d*$',
                description: 'Allow positive integers beginning from 1 as value.'
            },
            {
                name: 'Float',
                regex: '^[1-9](.[0-9]+)?$',
                description: 'Allow float numbers from 0.0 to 9.99.. as value.'
            },
            {
                name: 'Symbol',
                regex: ':^[a-zA-Z0-9_]*$',
                description: 'Allow only Type Symbol'
            },
            {
                name: 'Hash',
                regex: '^{a-zA-Z0-9}*$',
                description: ''
            },
            {
                name: 'Array',
                regex: '^[a-zA-Z0-9]*$',
                description: ''
            }
        ]
    }


    def self.options()
        @options
    end


    def self.meta()
        @meta
    end


    def self.sections()
        @sections
    end

    
    def self.payloads()
        @payloads
    end
end