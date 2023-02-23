using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DiscEffect : MonoBehaviour
{
    private AudioSource _sourceDisc;
    [SerializeField] private AudioClip _wallSound;
    [SerializeField] private AudioClip _breakSound;
    [SerializeField] private ParticleSystem _wallEffect;

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
        Vector3 wallPos = new Vector3(transform.position.x, transform.position.y + 0.125f, transform.position.z);
        if (collision.gameObject.tag == "Wall")
        {
            _sourceDisc.PlayOneShot(_wallSound);
            Instantiate(_wallEffect, wallPos, transform.rotation);
        }

        if(collision.gameObject.CompareTag("Obstacle"))
        {
            _sourceDisc.PlayOneShot(_breakSound);
        }
    }
}
