package com.example.imperative

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    private lateinit var countTextView: TextView
    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        countTextView = findViewById(R.id.countTextView)
    }

    fun incrementCount(view: android.view.View) {
        count++
        countTextView.text = count.toString()
    }

    fun decrementCount(view: android.view.View) {
        count--
        countTextView.text = count.toString()
    }

    fun resetCount(view: android.view.View) {
        count = 0
        countTextView.text = count.toString()
    }
}