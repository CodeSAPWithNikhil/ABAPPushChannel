CLASS zcl_apc_wsp_ext_zapc_basic DEFINITION
  PUBLIC
  INHERITING FROM cl_apc_wsp_ext_stateless_base
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: if_apc_wsp_extension~on_message REDEFINITION,
      if_apc_wsp_extension~on_start REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_apc_wsp_ext_zapc_basic IMPLEMENTATION.
  METHOD if_apc_wsp_extension~on_message.

    TRY.
        DATA(lv_text_msg)    = i_message->get_text( ).

        DATA(lo_producer) = CAST if_amc_message_producer_text(  cl_amc_channel_manager=>create_message_producer(
                                                                    i_application_id = 'ZAMC_BASIC'
                                                                    i_channel_id     = '/ping' ) ).
        lo_producer->send( i_message = lv_text_msg ).

      CATCH cx_root INTO DATA(lx_amc_error).
        data(lo_x) = lx_amc_error->get_longtext( ).
    ENDTRY.

  ENDMETHOD.

  METHOD if_apc_wsp_extension~on_start.

    TRY.
        DATA(lo_binding) = CAST if_apc_ws_binding_manager( i_context->get_binding_manager( ) ).
        lo_binding->bind_amc_message_consumer( i_application_id = 'ZAMC_BASIC'
                                               i_channel_id     = '/ping' ).


      CATCH cx_apc_error INTO DATA(lx_apc_error).
        MESSAGE  lx_apc_error->get_longtext( ) TYPE 'E'.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.