using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DiscEffect : MonoBehaviour
{
    private AudioSource _sourceDisc;
    [SerializeField] private AudioClip _wallSound;

    // Start is called before the first frame update
    void Start()
    {
        _sourceDisc = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {

    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Wall")
        {
            _sourceDisc.PlayOneShot(_wallSound);
        }
    }
}
