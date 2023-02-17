using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Break : MonoBehaviour
{
    [SerializeField] private ParticleSystem _breakParticleSystem;

    private AudioSource _audioSource;
    [SerializeField] private AudioClip _breakSound;

    private void Awake()
    {
        _breakParticleSystem = GetComponentInChildren<ParticleSystem>();
        _audioSource = GetComponent<AudioSource>();
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.tag == "Disc")
        {
            StartCoroutine(BreakObstacle());
        }
    }

    IEnumerator BreakObstacle()
    {
        _breakParticleSystem.Play();
        _audioSource.PlayOneShot(_breakSound);

        yield return new WaitForSeconds(_breakParticleSystem.main.startLifetime.constantMax);
        Destroy(gameObject);
    }
}
