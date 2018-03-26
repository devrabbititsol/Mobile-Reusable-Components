package com.devrabbit.sampleapp.Utils;

import android.app.Activity;
import android.graphics.Color;
import android.text.InputType;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;


public class Utils {

    private String firstNameString = "First Name";
    private String secondNameString = "Second Name";
    private String emailString = "Email";
    private String phoneNumberString  = "Phone Number";
    private String dobString = "DOB";
    private String emailAddressString = "Address";

    public TextView userNmaeLabel(Activity activity, String labelName) {
        TextView textView = new TextView(activity);
        textView.setText(labelName);
        textView.setTextSize(15);
        textView.setPadding(10, 10, 10, 10);
        textView.setTextColor(Color.parseColor("#000000"));
        return textView;
    }

    public EditText userNmaeEdit(Activity act, String lableName, int id) {

        EditText et = new EditText(act);
        final LinearLayout.LayoutParams lparams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT, 80); // Width , height
        lparams.setMargins(5, 5, 5, 5);
        et.setLayoutParams(lparams);
        et.setPadding(0, 0, 0, 15);
        et.setTextSize(18);
        et.setTextColor(Color.parseColor("#000000"));
        // String[] textArray = {"First Name", "Second Name", "Phone Number", "DOB", "Address"};
        if (lableName.equals(firstNameString)) {
            et.setId(id);
            et.setHint("Please enter"+lableName);
            et.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_CLASS_TEXT);
            et.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        } else if (lableName.equals(secondNameString)) {
            et.setId(id);
            et.setHint("Please enter"+lableName);
            et.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_CLASS_TEXT);
            et.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        } else if (lableName.equals(emailString)) {
            et.setId(id);
            et.setHint("Please enter "+lableName);
            et.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_CLASS_TEXT);
            et.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        } else if (lableName.equals(phoneNumberString)) {
            et.setId(id);
            et.setHint("Please enter "+lableName);
            et.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_CLASS_NUMBER);
            et.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        } else if (lableName.equals(dobString)) {
            et.setId(id);
            et.setHint("Please enter "+lableName);
            et.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_CLASS_NUMBER);
            et.setImeOptions(EditorInfo.IME_ACTION_NEXT);
            dobString  = et.getText().toString();
        } else if (lableName.equals(emailAddressString)) {
            et.setId(id);
            et.setHint("Please enter "+lableName);
            et.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_CLASS_TEXT);
            et.setImeOptions(EditorInfo.IME_ACTION_DONE);
        }
        return et;
    }

}
